/*
 * redpin.c - [Starting code for] a web-based manager of people and
 *            places.
 *
 * Based on:
 *  tiny.c - A simple, iterative HTTP/1.0 Web server that uses the
 *      GET method to serve static and dynamic content.
 *   Tiny Web server
 *   Dave O'Hallaron
 *   Carnegie Mellon University
 */
#include "csapp.h"
#include "dictionary.h"
#include "more_string.h"

static void doit(int fd);
static void *go_doit(void* connfp);
static dictionary_t *read_requesthdrs(rio_t *rp);
static void read_postquery(rio_t *rp, dictionary_t *headers, dictionary_t *d);
static void clienterror(int fd, char *cause, char *errnum,
                        char *shortmsg, char *longmsg);
static void print_stringdictionary(dictionary_t *d);
static void serve_request(int fd, dictionary_t *query);
//static void sum_request2(int fd, dictionary_t *query);
static void counts_request(int fd, dictionary_t *query);
static void reset_request(int fd, dictionary_t *query);
static void people_request(int fd, dictionary_t *query);
static void places_request(int fd, dictionary_t *query);
static void pin_request(int fd, dictionary_t *query);
static void unpin_request(int fd, dictionary_t *query);
static void copy_request(int fd, dictionary_t *query);

dictionary_t* people;
dictionary_t* places;

int main(int argc, char **argv)
{
  int listenfd, connfd;
  char hostname[MAXLINE], port[MAXLINE];
  socklen_t clientlen;
  struct sockaddr_storage clientaddr;

  /* Check command line args */
  if (argc != 2) {
    fprintf(stderr, "usage: %s <port>\n", argv[0]);
    exit(1);
  }

  // initialize the dictionaries
  people = make_dictionary(COMPARE_CASE_SENS, free);
  places = make_dictionary(COMPARE_CASE_SENS, free);

  listenfd = Open_listenfd(argv[1]);

  /* Don't kill the server if there's an error, because
     we want to survive errors due to a client. But we
     do want to report errors. */
  exit_on_error(0);

  /* Also, don't stop on broken connections: */
  Signal(SIGPIPE, SIG_IGN);

  while (1) {
    clientlen = sizeof(clientaddr);
    connfd = Accept(listenfd, (SA *)&clientaddr, &clientlen);
    if (connfd >= 0) {
      Getnameinfo((SA *) &clientaddr, clientlen, hostname, MAXLINE,
                  port, MAXLINE, 0);
      printf("Accepted connection from (%s, %s)\n", hostname, port);

      int *connfdp;
      pthread_t th;
      connfdp = malloc(sizeof(int));
      *connfdp = connfd;
      Pthread_create(&th, NULL, go_doit, connfdp);
      Pthread_detach(th);
    }
  }
}

void *go_doit(void *connfdp)
{
  int connfd = *(int *)connfdp;
  free(connfdp);
  doit(connfd);
  Close(connfd);
  return NULL;
}

/*
 * doit - handle one HTTP request/response transaction
 */
void doit(int fd)
{
  char buf[MAXLINE], *method, *uri, *version;
  rio_t rio;
  dictionary_t *headers, *query;

  /* Read request line and headers */
  Rio_readinitb(&rio, fd);
  if (Rio_readlineb(&rio, buf, MAXLINE) <= 0)
    return;
  printf("%s", buf);

  if (!parse_request_line(buf, &method, &uri, &version)) {
    clienterror(fd, method, "400", "Bad Request",
                "Redpin did not recognize the request");
  } else {
    if (strcasecmp(version, "HTTP/1.0")
        && strcasecmp(version, "HTTP/1.1")) {
      clienterror(fd, version, "501", "Not Implemented",
                  "Redpin does not implement that version");
    } else if (strcasecmp(method, "GET")
               && strcasecmp(method, "POST")) {
      clienterror(fd, method, "501", "Not Implemented",
                  "Redpin does not implement that method");
    } else {
      headers = read_requesthdrs(&rio);

      /* Parse all query arguments into a dictionary */
      query = make_dictionary(COMPARE_CASE_SENS, free);
      parse_uriquery(uri, query);
      if (!strcasecmp(method, "POST"))
        read_postquery(&rio, headers, query);

      /* For debugging, print the dictionary */
      print_stringdictionary(query);

      // check uri to determine how to handle request
      if (starts_with("/counts", uri))
      {
        counts_request(fd, query);
      }
      else if (starts_with("/reset", uri))
      {
        reset_request(fd, query);
      }
      else if (starts_with("/people", uri))
      {
        people_request(fd, query);
      }
      else if (starts_with("/places", uri))
      {
        places_request(fd, query);
      }
      else if (starts_with("/pin", uri))
      {
        pin_request(fd, query);
      }
      else if (starts_with("/unpin", uri))
      {
        unpin_request(fd, query);
      }
      else if (starts_with("/copy", uri))
      {
        copy_request(fd, query);
      }
      else
      {
        //return error?
        serve_request(fd, query);
      }

      /* Clean up */
      dictionary_free(query);
      dictionary_free(headers);
    }

    /* Clean up status line */
    free(method);
    free(uri);
    free(version);
  }
}

/*
 * read_requesthdrs - read HTTP request headers
 */
dictionary_t *read_requesthdrs(rio_t *rp)
{
  char buf[MAXLINE];
  dictionary_t *d = make_dictionary(COMPARE_CASE_SENS, free);

  Rio_readlineb(rp, buf, MAXLINE);
  while(strcmp(buf, "\r\n")) {
    printf("%s", buf);
    parse_header_line(buf, d);
    Rio_readlineb(rp, buf, MAXLINE);
  }

  return d;
}

void read_postquery(rio_t *rp, dictionary_t *headers, dictionary_t *dest)
{
  char *len_str, *type, *buffer;
  int len;

  len_str = dictionary_get(headers, "Content-Length");
  len = (len_str ? atoi(len_str) : 0);

  type = dictionary_get(headers, "Content-Type");

  buffer = malloc(len+1);
  Rio_readnb(rp, buffer, len);
  buffer[len] = 0;

  if (!strcasecmp(type, "application/x-www-form-urlencoded")) {
    parse_query(buffer, dest);
  }

  free(buffer);
}

static char *ok_header(size_t len, const char *content_type) {
  char *len_str, *header;

  header = append_strings("HTTP/1.0 200 OK\r\n",
                          "Server: Redpin Web Server\r\n",
                          "Connection: close\r\n",
                          "Content-length: ", len_str = to_string(len), "\r\n",
                          "Content-type: ", content_type, "\r\n\r\n",
                          NULL);
  free(len_str);

  return header;
}

/*
 * serve_request - example request handler
 */
static void serve_request(int fd, dictionary_t *query)
{
  size_t len;
  char *body, *header;

  body = strdup("alice\nbob\n");

  len = strlen(body);

  /* Send response headers to client */
  header = ok_header(len, "text/http; charset=utf-8");
  Rio_writen(fd, header, strlen(header));
  printf("Response headers:\n");
  printf("%s", header);

  free(header);

  /* Send response body to client */
  Rio_writen(fd, body, len);

  free(body);
}

// serves a counts request
static void counts_request(int fd, dictionary_t *query)
{
  size_t len;
  char *body, *header;

  int people_count = dictionary_count(people);
  int places_count = dictionary_count(places);

  body = append_strings(to_string(people_count), "\n", to_string(places_count), "\n", NULL);

  len = strlen(body);

  /* Send response headers to client */
  header = ok_header(len, "text/plain; charset=utf-8");
  Rio_writen(fd, header, strlen(header));
  printf("Response headers:\n");
  printf("%s", header);

  free(header);

  /* Send response body to client */
  Rio_writen(fd, body, len);

  free(body);
}

static void reset_request(int fd, dictionary_t *query)
{
  size_t len;
  char *body, *header;

  dictionary_free(people);
  dictionary_free(places);
  people = make_dictionary(COMPARE_CASE_SENS, free);
  places = make_dictionary(COMPARE_CASE_SENS, free);

  body = strdup("0\n0\n");

  len = strlen(body);

  /* Send response headers to client */
  header = ok_header(len, "text/http; charset=utf-8");
  Rio_writen(fd, header, strlen(header));
  printf("Response headers:\n");
  printf("%s", header);

  free(header);

  /* Send response body to client */
  Rio_writen(fd, body, len);

  free(body);
}

static void people_request(int fd, dictionary_t *query)
{
  size_t len;
  char *body, *header, *place;

  if (!dictionary_has_key(query, "place"))
  {
    clienterror(fd, "Invalid place argument", "400", "", "");
    return;
  }
  place = dictionary_get(query, "place");
  
  body = "";
  if (!place)
  {
    //return all people
    const char** all_people = dictionary_keys(people);

    int i = 0;
    for (i = 0; i < dictionary_count(people); i++)
    {
      body = append_strings(body, all_people[i], "\n", NULL);
    }

    free(all_people);
  }
  else if (dictionary_has_key(places, place))
  {
    //gets all people at `place`
    dictionary_t *temp = dictionary_get(places, place); //free?
    const char** all_people = dictionary_keys(temp);

    int i = 0;
    for (i = 0; i < dictionary_count(temp); i++)
    {
      body = append_strings(body, all_people[i], "\n", NULL);
    }

    free(all_people);
  }
  else
  {
    body = strdup("");
  }

  len = strlen(body);

  /* Send response headers to client */
  header = ok_header(len, "text/http; charset=utf-8");
  Rio_writen(fd, header, strlen(header));
  printf("Response headers:\n");
  printf("%s", header);

  free(header);

  /* Send response body to client */
  Rio_writen(fd, body, len);

  free(body);
}

static void places_request(int fd, dictionary_t *query)
{
  size_t len;
  char *body, *header, *person;

  if (!dictionary_has_key(query, "person"))
  {
    clienterror(fd, "Invalid person argument", "400", "", "");
    return;
  }
  person = dictionary_get(query, "person");
  
  body = "";
  if (!person)
  {
    //return all places
    const char** all_places = dictionary_keys(places);

    int i = 0;
    for (i = 0; i < dictionary_count(places); i++)
    {
      body = append_strings(body, all_places[i], "\n", NULL);
    }

    free(all_places);
  }
  else if (dictionary_has_key(people, person))
  {
    //gets all people at `place`
    dictionary_t *temp = dictionary_get(people, person);
    const char** all_places = dictionary_keys(temp);

    int i = 0;
    for (i = 0; i < dictionary_count(temp); i++)
    {
      body = append_strings(body, all_places[i], "\n", NULL);
    }

    free(all_places);
  }
  else
  {
    body = strdup("");
  }

  len = strlen(body);

  /* Send response headers to client */
  header = ok_header(len, "text/http; charset=utf-8");
  Rio_writen(fd, header, strlen(header));
  printf("Response headers:\n");
  printf("%s", header);

  free(header);

  /* Send response body to client */
  Rio_writen(fd, body, len);

  free(body);
}

static void pin_request(int fd, dictionary_t *query)
{
  if (!dictionary_has_key(query, "people"))
  {
    clienterror(fd, "Invalid people argument", "400", "", "");
    return;
  }
  char* new_people = query_decode(dictionary_get(query, "people"));

  if (!dictionary_has_key(query, "places"))
  {
    clienterror(fd, "Invalid places argument", "400", "", "");
    return;
  }
  char* new_places = query_decode(dictionary_get(query, "places"));

  char** people_list = split_string(new_people, '\n');
  char** places_list = split_string(new_places, '\n');

  free(new_people);
  free(new_places);

  int i = 0, j = 0;
  for (i = 0; people_list[i]; i++)
  {
    for (j = 0; places_list[j]; j++)
    {
      printf("Adding %s to %s\n", people_list[i], places_list[j]);
      //add person to place
      if (dictionary_has_key(places, places_list[j]))
      {
        //if this place is already in `places`
        dictionary_t *temp = dictionary_get(places, places_list[j]); //don't free?
        char* temp_person = people_list[i]; //don't free
        dictionary_set(temp, temp_person, NULL);
      }
      else
      {
        //create new dictionary for this place
        dictionary_t* temp = make_dictionary(COMPARE_CASE_SENS, free); //don't free
        //add person to this new place
        char* temp_person = people_list[i]; //don't free
        dictionary_set(temp, temp_person, NULL);
        //add this place to places
        dictionary_set(places, places_list[j], temp);
      }

      //add place to person
       if (dictionary_has_key(people, people_list[i]))
      {
        //if this person is already in `people`
        dictionary_t *temp = dictionary_get(people, people_list[i]); //don't free?
        char* temp_place = places_list[j]; //don't free
        dictionary_set(temp, temp_place, NULL);
      }
      else
      {
        //create new dictionary for this person
        dictionary_t* temp = make_dictionary(COMPARE_CASE_SENS, free); //don't free
        //add place to this new person
        char* temp_place = places_list[j]; //don't free
        dictionary_set(temp, temp_place, NULL);
        //add this person to people
        dictionary_set(people, people_list[i], temp);
      }
    }
  }
  free(people_list);
  free(places_list);

  counts_request(fd, query);
}

static void unpin_request(int fd, dictionary_t *query)
{
  if (!dictionary_has_key(query, "people"))
  {
    clienterror(fd, "Invalid people argument", "400", "", "");
    return;
  }
  char* new_people = query_decode(dictionary_get(query, "people"));

  if (!dictionary_has_key(query, "places"))
  {
    clienterror(fd, "Invalid places argument", "400", "", "");
    return;
  }
  char* new_places = query_decode(dictionary_get(query, "places"));

  char** people_list = split_string(new_people, '\n');
  char** places_list = split_string(new_places, '\n');

  free(new_people);
  free(new_places);

  int i = 0, j = 0;
  for (i = 0; people_list[i]; i++)
  {
    for (j = 0; places_list[j]; j++)
    {
      printf("Removing %s from %s\n", people_list[i], places_list[j]);

      // check to see if this person was at this place
      if (dictionary_has_key(places, places_list[j]))
      {
        dictionary_t* temp = dictionary_get(places, places_list[j]);
        if (dictionary_has_key(temp, people_list[i]))
        {
          if (dictionary_count(temp) == 1)
          {
            // if this is the last person, delete the dictionary
            dictionary_remove(places, places_list[j]);
          }
          else
          {
            // remove the person from the place
            dictionary_remove(temp, people_list[i]);
          }
        }
      }

      // check to see if this place was visited by this person
      if (dictionary_has_key(people, people_list[i]))
      {
        dictionary_t* temp = dictionary_get(people, people_list[i]);
        if (dictionary_has_key(temp, places_list[j]))
        {
          if (dictionary_count(temp) == 1)
          {
            // if this is the last person, delete the dictionary
            dictionary_remove(people, people_list[j]);
          }
          else
          {
            // remove the person from the place
            dictionary_remove(temp, places_list[j]);
          }
        }
      }
    }
  }

  free(people_list);
  free(places_list);

  counts_request(fd, query);
}

static void copy_request(int fd, dictionary_t *query)
{
  if (!dictionary_has_key(query, "host"))
  {
    clienterror(fd, "Invalid host argument", "400", "", "");
    return;
  }
  char* host = dictionary_get(query, "host");
  if (!dictionary_has_key(query, "port"))
  {
    clienterror(fd, "Invalid port argument", "400", "", "");
    return;
  }
  char* port = dictionary_get(query, "port");
  
  // open a connection to the new host
  int client_fd = Open_clientfd(host, port);

  char* body;
  if (dictionary_has_key(query, "person"))
  {
    // copying a person
    if (!dictionary_has_key(query, "person"))
    {
      clienterror(fd, "Invalid person argument", "400", "", "");
      return;
    }
    char* person = dictionary_get(query, "person");
    // create request
    body = append_strings("GET /places?person=", person, " HTTP/1.1\r\n\r\n",
                          NULL);
    // send request
    Rio_writen(client_fd, body, strlen(body));

    char buf[MAXLINE], *version, *status, *desc;
    rio_t rio;

    Rio_readinitb(&rio, client_fd);
    // read initial header
    Rio_readlineb(&rio, buf, MAXLINE);
    parse_status_line(buf, &version, &status, &desc);
    dictionary_t* temp = make_dictionary(COMPARE_CASE_SENS, free);
    // read the rest of the response
    do 
    {
      Rio_readlineb(&rio, buf, MAXLINE);
      parse_header_line(buf, temp);
    } 
    while(strcmp(buf, "\r\n"));

    char* size = dictionary_get(temp, "Content-length");
    size_t len = atoi(size);
    char new_buf[len];
    Rio_readnb(&rio, new_buf, len);

    char* as_person = dictionary_get(query, "as");
    dictionary_set(temp, "places", new_buf);
    dictionary_set(temp, "people", as_person);
    pin_request(fd, temp);
    free(temp);
  }
  else if (dictionary_has_key(query, "place"))
  {
    // copying a place
  }
  else
  {
    // send an error
  }
}

/*
 * clienterror - returns an error message to the client
 */
void clienterror(int fd, char *cause, char *errnum,
		 char *shortmsg, char *longmsg)
{
  size_t len;
  char *header, *body, *len_str;

  body = append_strings("<html><title>Redpin Error</title>",
                        "<body bgcolor=""ffffff"">\r\n",
                        errnum, " ", shortmsg,
                        "<p>", longmsg, ": ", cause,
                        "<hr><em>Redpin Server</em>\r\n",
                        NULL);
  len = strlen(body);

  /* Print the HTTP response */
  header = append_strings("HTTP/1.0 ", errnum, " ", shortmsg, "\r\n",
                          "Content-type: text/html; charset=utf-8\r\n",
                          "Content-length: ", len_str = to_string(len), "\r\n\r\n",
                          NULL);
  free(len_str);

  Rio_writen(fd, header, strlen(header));
  Rio_writen(fd, body, len);

  free(header);
  free(body);
}

static void print_stringdictionary(dictionary_t *d)
{
  int i;
  const char **keys;

  keys = dictionary_keys(d);

  for (i = 0; keys[i] != NULL; i++) {
    printf("%s=%s\n",
           keys[i],
           (const char *)dictionary_get(d, keys[i]));
  }
  printf("\n");

  free(keys);
}
