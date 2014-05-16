global class Smtpapi {
  public Smtpapi() {}

  global class Header {
    private List<String> to = new List<String>();
    private Map<String, Object> sub = new Map<String, Object>();
    private Map<String, String> unique_args = new Map<String, String>();
    private List<String> category = new List<String>();
    private Map<String, String> section = new Map<String, String>();
    private Map<String, Map<String, Map<String,String>>> filters = new Map<String, Map<String, Map<String,String>>>();

    public Header() {}

    public Map<String, Object> toMap() {
      Map<String, Object> data = new Map<String, Object>();

      if (!this.to.isEmpty()) {
        data.put('to', this.to);
      }
      
      if (!this.sub.isEmpty()) {
        data.put('sub', this.sub);
      }
      
      if (!this.unique_args.isEmpty()) {
        data.put('unique_args', this.unique_args);
      }

      if (!this.category.isEmpty()) {
        data.put('category', this.category);
      }

      if (!this.section.isEmpty()) {
        data.put('section', this.section);
      }

      if (!this.filters.isEmpty()) {
        data.put('filters', this.filters);
      }

      return data;
    }

    public String jsonString() {
      Map<String, Object> data = this.toMap();
      return JSON.serialize(data);
    }

    public Header addTo(String to) {
      this.to.add(to);
      return this;
    }

    public Header setTos(List<String> tos) {
      this.to = tos;
      return this;
    }

    public Header addSubstitution(String key, List<String> val) {
      for (Integer i = 0; i < val.size(); i++) {
        List<String> val_in_array = new List<String> { val[i] };
        this.sub.put(key, val_in_array);
      }
      return this;
    }

    public Header setSubstitutions(Map<String, Object> substitutions) {
      this.sub = substitutions;
      return this;
    }

    public Header addUniqueArg(String key, String val) {
      this.unique_args.put(key, val);
      return this;
    }

    public Header setUniqueArgs(Map<String, String> unique_arguments) {
      this.unique_args = unique_arguments;
      return this;
    }

    public Header addCategory(String val) {
      this.category.add(val);
      return this;
    }

    public Header setCategories(List<String> categories) {
      this.category = categories;
      return this;
    }

    public Header addSection(String key, String val) {
      this.section.put(key, val);
      return this;
    }

    public Header setSections(Map<String, String> sections) {
      this.section = sections;
      return this;
    }

    public Header addFilter(String filter_name, String parameter_name, String parameter_value) {

      Map<String, String> settings = new Map<String, String> { parameter_name => parameter_value };
      Map<String, Map<String, String>> filter_value = new Map<String, Map<String, String>> { 'settings' => settings };
      this.filters.put(filter_name, filter_value);
      
      return this;
    }

    public Header setFilters(Map<String, Map<String, Map<String,String>>> filters) {
      this.filters = filters;
      return this;
    }
  }
}