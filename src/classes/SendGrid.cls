global class SendGrid {
  private static final String ENCODING = 'UTF-8';

  private String username;
  private String password;

  private List<string> tos = new List<String>();

  public SendGrid(String username, String password) {
    this.username = username;
    this.password = password;
  }

  public String credentialsToWebFormat() {
    String output = '';

    output += '?api_user=' + this.username;
    output += '&api_key=' + this.password;

    return output;
  }

  public String send(SendGrid.Email email) {
    String body = this.credentialsToWebFormat() + email.toWebFormat();

    HttpRequest req = new HttpRequest();
    HttpResponse res = new HttpResponse();
    Http http = new Http();

    req.setEndpoint('http://api.sendgrid.com/api/mail.send.json');
    req.setMethod('POST');
    req.setBody(body);
    req.setCompressed(true); // otherwise we hit a limit of 32000

    res = http.send(req);

    return res.getBody();
  }

  global class Email {
    public Smtpapi.Header smtpapi;

    public String fromm;
    public String fromname;
    public String replyto;
    public List<String> bcc = new List<String>();
    public String subject;
    public String text;
    public String html;
    public Map<String, String> headers = new Map<String, String>();

    public Email() {
      this.smtpapi = new Smtpapi.Header();
    }

    public Email addTo(String to) {
      this.smtpapi.addTo(to);
      return this;
    }

    public Email setTos(List<String> tos) {
      this.smtpapi.setTos(tos);
      return this;
    }

    public Email setFrom(String email) {
      this.fromm = email;
      return this;
    }

    public Email setFromName(String name) {
      this.fromname = name;
      return this;
    }

    public Email setReplyTo(String email) {
      this.replyto = email;
      return this;
    }

    public Email addBcc(String email) {
      this.bcc.add(email);
      return this;
    }

    public Email setSubject(String subject) {
      this.subject = subject;
      return this;
    }

    public Email setText(String text) {
      this.text = text;
      return this;
    }

    public Email setHtml(String html) {
      this.html = html;
      return this;
    }

    public Email addSubstitution(String key, List<String> val) {
      this.smtpapi.addSubstitution(key, val);
      return this;
    }

    public Email addUniqueArg(String key, String val) {
      this.smtpapi.addUniqueArg(key, val);
      return this;
    }

    public Email addCategory(String category) {
      this.smtpapi.addCategory(category);
      return this;
    }

    public Email addSection(String key, String val) {
      this.smtpapi.addSection(key, val);
      return this;
    }

    public Email addFilter(String filter_name, String parameter_name, String parameter_value) {
      this.smtpapi.addFilter(filter_name, parameter_name, parameter_value);
      return this;
    }

    public Email addHeader(String key, String val) {
      this.headers.put(key, val);
      return this;
    }

    public String toWebFormat() {
      String output = '';

      // updateMissingTo - There needs to be at least 1 to address, 
      // or else the mail won't send.
      if (!this.smtpapi.to.isEmpty() && !String.isBlank(this.fromm)) {
        output += '&to=' + this.fromm;
      }

      if (!String.isBlank(this.fromm)) {
        String encoded = EncodingUtil.urlEncode(this.fromm, ENCODING);
        output += '&from=' + encoded;
      }

      if (!String.isBlank(this.fromname)) {
        String encoded = EncodingUtil.urlEncode(this.fromname, ENCODING);
        output += '&fromname=' + encoded;
      }

      if (!String.isBlank(this.replyto)) {
        String encoded = EncodingUtil.urlEncode(this.replyto, ENCODING);
        output += '&replyto=' + encoded;
      }

      if (!this.bcc.isEmpty()) {
        for (String bcc_email : this.bcc) {
          String encoded = EncodingUtil.urlEncode(bcc_email, ENCODING);
          output += '&bcc[]=' + encoded;
        }
      }

      if (!String.isBlank(this.subject)) {
        String encoded = EncodingUtil.urlEncode(this.subject, ENCODING);
        output += '&subject=' + encoded;
      }

      if (!String.isBlank(this.text)) {
        String encoded = EncodingUtil.urlEncode(this.text, ENCODING);
        output += '&text=' + encoded;
      }

      if (!String.isBlank(this.html)) {
        String encoded = EncodingUtil.urlEncode(this.html, ENCODING);
        output += '&html=' + encoded;
      }


      if (this.smtpapi.jsonString() != '{}') {
        String encoded = EncodingUtil.urlEncode(this.smtpapi.jsonString(), ENCODING);
        output += '&x-smtpapi=' + encoded;
      }

      if (!this.headers.isEmpty()) {
        String serialized_headers = JSON.serialize(this.headers);
        String encoded = EncodingUtil.urlEncode(serialized_headers, ENCODING);
        output += '&headers=' + encoded;
      }

      return output;
    }
  }
}