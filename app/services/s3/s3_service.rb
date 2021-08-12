require 'aws-sdk'
require 'dotenv'

Dotenv.load

module AppServices
  class S3
    def initialize(bucketName=nil)
      s3 = Aws::S3::Resource.new
      @bucket = s3.bucket(ENV['BUCKET_NAME'])
    end

    def self.getFiles
      data = @bucket.objects.each do |obj|
        "#{obj.key} => #{obj.etag}"
      end
      data
    end

    def self.getFile(fileName)
      @bucket.objects(prefix: fileName)
    end

    def update
      puts "test"
    end
  end
end
