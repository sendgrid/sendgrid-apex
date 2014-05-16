global class SendGrid {
  private String username;
  private String password;
  private List<string> tos = new List<String>();

  public SendGrid(String username, String password) {
    this.username = username;
    this.password = password;
  }

  public SendGrid addTo(String email) {
    this.tos.add(email);
    return this;
  }

  public List<string> getTos() {
    return this.tos;
  }
}