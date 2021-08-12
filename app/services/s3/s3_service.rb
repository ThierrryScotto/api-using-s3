require 'aws-sdk'
require 'dotenv'

Dotenv.load

module AppServices
  class S3
    def self.getFiles
      getConnection
      data = @bucket.objects.each do |obj|
        "#{obj.key} => #{obj.etag}"
      end
      data
    end

    def self.getFile(fileName)
      getConnection
      @bucket.objects(prefix: fileName)
    end

    private
      def self.getConnection
        s3 = Aws::S3::Resource.new
        @bucket = s3.bucket(ENV['BUCKET_NAME'])
      end
  end
end

AppServices::S3.getFile('test')