module CodePicnic
  class Console
    include APIRequest

    @api_url = "https://codepicnic.com/api/consoles"

    attr_accessor :id, :name, :container_name, :container_type, :custom_image
    attr_accessor :created_at, :permalink, :url, :is_headless, :embed_url
    attr_accessor :permalink, :terminal_url

    def initialize(opts={})
      @id               = opts.delete("id")             || opts.delete(:id)
      @name             = opts.delete("name")           || opts.delete(:name)
      @container_name   = opts.delete("container_name") || opts.delete(:container_name)
      @container_type   = opts.delete("container_type") || opts.delete(:container_type)
      @custom_image     = opts.delete("custom_image")   || opts.delete(:custom_image)
      @created_at       = opts.delete("created_at")     || opts.delete(:created_at)
      @container_size   = opts.delete("container_size") || opts.delete(:container_size)
      @title            = @name || opts.delete("title") || opts.delete(:title)
      @hostname         = opts.delete("hostname")       || opts.delete(:hostname)
      @is_headless      = opts.delete("is_headless")    || opts.delete(:is_headless)
      @url              = opts.delete("url")            || opts.delete(:url)
      @embed_url        = opts.delete("embed_url")      || opts.delete(:embed_url)
      @permalink        = opts.delete("permalink")      || opts.delete(:permalink)
      @terminal_url     = opts.delete("terminal_url")   || opts.delete(:terminal_url)
    end

    def find
      get url_to(@container_name, "show")
    end

    def save
      response = post(url_to, {console: cleaned_params})
      self.container_name = response["container_name"]
      self.url = response["url"]
      response
    end

    def start
      result  = post(url_to(@container_name, "start"))
      @url    = result["url"]
      result
    end

    def stop
      post url_to(@container_name, "stop")
    end

    def restart
      post url_to(@container_name, "restart")
    end

    def forks
      get url_to(@container_name, "forks")
    end

    def files
      get url_to(@container_name, "files")
    end

    def file_content(path = "")
      get url_to(@container_name, path)
    end

    def exec(commands = [])
      post url_to(@container_name, "exec"), {commands: commands}
    end

    def upload_file(file = nil, path = nil)
      path = "/app/#{file.path}" unless path
      post_form url_to(@container_name, "upload_file"), {path: path, file: file}
    end

    def search(term, path)
      get url_to(@container_name, "search")
    end

    private

    def cleaned_params
      params = {container_type: @container_type, custom_image: @custom_image, container_size: @container_size, title: @title, hostname: @hostname}
      params.delete_if { |key, value| value.nil? || value == "" }
      params
    end

    # Class Methods
    class << self
      attr_accessor :api_url

      def all
        get(url_to)["consoles"].map{|data| Console.new(data) }
      end

      def find(container_name)
        Console.new(get(url_to(container_name)))
      end

      def batch_exec(commands = [], container_names = [])
        post url_to(nil, "exec"), {commands: commands, container_names: container_names }
      end

    end

  end
end