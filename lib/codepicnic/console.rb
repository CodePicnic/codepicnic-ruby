module CodePicnic
  class Console
    include APIRequest

    @api_url = "https://codepicnic.com/api/consoles"
    attr_accessor :id, :name, :container_name, :container_type, :custom_image, :created_at, :permalink, :url

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
    end

    def save
      post url, {bite: {custom_image: @custom_image, container_name: @container_name, container_size: @container_size, title: @title, hostname: @hostname}}
    end

    def start
      result  = post(url(@container_name, "start"))
      @url    = result["url"]
      result
    end

    def stop
      post url(@container_name, "stop")
    end

    def restart
      post url(@container_name, "restart")
    end

    def forks
      get url(@container_name, "forks")
    end

    def files
      get url(@container_name, "files")
    end

    def file_content(path = "")
      get url(@container_name, path)
    end

    def exec(commands = [])
      post url(@container_name, "exec"), {commands: commands}
    end

    # Class Methods
    class << self
      attr_accessor :api_url

      def all
        get(url)["consoles"].map{|data| Console.new(data) }
      end

      def batch_exec(commands = [], container_names = [])
        post url(nil, "exec"), {commands: commands, container_names: container_names }
      end

    end

  end
end