module AppSwagger
  class Root
    include Swagger::Blocks

    swagger_root do
      key :swagger, '2.0'
      info do
        key :version, '1.0.0'
        key :title, 'Action Validators API'
        key :description, 'Action Validators API documentation.'
        
        contact do
          key :name, 'Test'
          key :email, 'admin@test.com'
        end
      end

      key :host, [Rails.application.routes.default_url_options[:host], Rails.application.routes.default_url_options[:port]].compact.join(':')
      key :basePath, '/'
      key :consumes, ['application/json']
      key :produces, ['application/json']
    end
  end
end