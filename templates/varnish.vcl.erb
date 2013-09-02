# Managed by puppet - Do not modify!

backend default {
  .host = "127.0.0.1";
  .port = "8080";
#  .first_byte_timeout = 300s;
#  .probe = {
#    .url = "/";
#    .timeout = 1s;
#    .interval = 5s;
#    .window = 1;
#    .threshold = 1;
#  }
}

# NOTE: vcl_recv is called at the beginning of a request, after the complete
# request has been received and parsed. Its purpose is to decide whether or not
# to serve the request, how to do it, and, if applicable, which backend to use.
sub vcl_recv {

  # Normalize Accept-Encoding to prevent duplicates in the cache
  # https://www.varnish-cache.org/trac/wiki/VCLExampleNormalizeAcceptEncoding
  if (req.http.Accept-Encoding) {
    if (req.url ~ "\.(jpg|png|gif|gz|tgz|bz2|tbz|mp3|ogg)$") {
      # No point in compressing these
      remove req.http.Accept-Encoding;
    } else if (req.http.Accept-Encoding ~ "gzip") {
      # If the browser supports it, we'll use gzip.
      set req.http.Accept-Encoding = "gzip";
    } else if (req.http.Accept-Encoding ~ "deflate") {
      # Next, try deflate if it is supported.
      set req.http.Accept-Encoding = "deflate";
    } else {
      # Unknown algorithm. Remove it and send unencoded.
      unset req.http.Accept-Encoding;
    }
  }

#  # Insert the client's real IP into the request
#  if (req.http.x-forwarded-for) {
#    set req.http.X-Forwarded-For = req.http.X-Forwarded-For;
#  } else {
#    set req.http.X-Forwarded-For = client.ip;
#  }

  # Strip cookies from static content
  if (req.url ~ "\.(png|gif|jpg|css|js)$" || req.url ~ "/view?id=home" || req.url ~ "/$") {
    unset req.http.cookie;
    unset req.http.cache-control;
  }
}

sub vcl_pipe {
  # Note that only the first request to the backend will have
  # X-Forwarded-For set.  If you use X-Forwarded-For and want to
  # have it set for all requests, make sure to have:
  # set bereq.http.connection = "close";
  # here.  It is not set by default as it might break some broken web
  # applications, like IIS with NTLM authentication.
  set bereq.http.connection = "close";
  return(pipe);
}

# NOTE: vcl_fetch is called after a document has been successfully retrieved
# from the backend. Normal tasks her are to alter the response headers, trigger
# ESI processing, try alternate backend servers in case the request failed.
sub vcl_fetch {

  # Keep objects 1 hour in cache past their expiry time. This allows varnish
  # to server stale content if the backend is sick.
  set beresp.grace = 1h;

  # Strip cookies from static content
  if (req.url ~ "\.(png|gif|jpg|css|js)$" || req.url ~ "/view?id=home" || req.url ~ "/$") {
    unset beresp.http.cookie;
    unset beresp.http.set-cookie;
  }
}

sub vcl_deliver {
  # The below provides custom headers to indicate whether the response came from
  # varnish cache or directly from the app.
  if (obj.hits > 0) {
    set resp.http.X-Varnish-Cache = "HIT";
  } else {
    set resp.http.X-Varnish-Cache = "MISS";
  }

  remove resp.http.X-Varnish;
  remove resp.http.Via;
  remove resp.http.X-Powered-By;
  remove resp.http.Pragma;
  #remove resp.http.Age;
  #remove resp.http.Cache-Control;
}
