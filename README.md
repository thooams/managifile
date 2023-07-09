# Managifile
Short description and motivation.

## Installation
Add this line to your Rails application's Gemfile:

```ruby
gem "managifile", github: "thooams/managifile"
```

And then execute:
```bash
$ bundle
```


```
rails g managifile your_model_name # eq. rails g managifile document
rails db:migrate

```


## Usage

### Attachable

```
# app/models/your_model.rb
class Document < ApplicationRecord
   include Managifile::ManagifileAttachable

   managifile_attachable attribute: :files
   # or
   managifile_attachable attribute: :files, content_types: %i[pdf doc csv]
   # or
   managifile_attachable attribute: :files, content_types: %i[pdf doc csv],
                         number_limit_max: 2, number_limit_min: 0,
                         size_limit: 5_000_000
   end
   ...
end
```
You can change your attribute name ("files" by default)
You can change several settings like content_types, number_limit_max. ...

Now you can attach files like this (eq. Document is your model):
Read active storage doc before : https://edgeguides.rubyonrails.org/active_storage_overview.html

```
document = Document.first
document.attach(io: File.open('/path/to/file'), filename: 'file.pdf', content_type: 'application/pdf')
```

Or in your controller

```
class DocumentController < ApplicationController
  def create
    document = Document.create!(document_params)
    redirect_to root_path
  end

  private

    def document_params
      params.require(:user).permit(:name, files: [])
    end
end
```


## S3

You can upload files on S3 if you want, you must only config the
config/storage.yml :
```
test:
  service: Disk
  root: <%= Rails.root.join("tmp/storage") %>

local:
  service: Disk
  root: <%= Rails.root.join("storage") %>

# Use bin/rails credentials:edit to set the AWS secrets (as aws:access_key_id|secret_access_key)
amazon:
  service: S3
  access_key_id: <%= Rails.application.credentials.dig(:aws, :access_key_id) %>
  secret_access_key: <%= Rails.application.credentials.dig(:aws, :secret_access_key) %>
  region: us-east-1 # by example
  bucket: your_own_bucket-<%= Rails.env %>
```

To use the S3 service in production, you add the following to config/environments/production.rb:

```
# Store files on Amazon S3.
config.active_storage.service = :amazon
```


## Rights / Permissions

You need a user and give permissions to your model eq. Document
Rights are: [:create, :update, :delete, :read]


```
# Give all rights
document = Document.first
document.permissions.create(user: user)

# Give only creation and updating rights
document.permissions.find_by(user_id: user.id).update(rights: [update, create])
```

Permissions use pundit to give REST access to your document.
Read pundit doc before : https://github.com/varvet/pundit
In your resource controller eq. document_controller.rb you can write this:

```
# app/controller/document_controller.rb

class DocumentController < ApplicationController
...

  def update
    @document = Document.find(params[:id])
    authorize @document
  end
...
end

```
If the user doesn’t have rights to this document, an error pundit will raised.


## State

Your model have a state notion now.
Read aasm doc before: https://github.com/aasm/aasm
You can change the state like this.

```
document = Document.create!(name: "test")
document.aasm_state #=> "draft"
document.publish! #=> "published"
document.share! #=> "shared"
```

Here the configuration used in Managifile:
```
aasm do
    state :draft, initial: true
    state :published
    state :shared

    event :publish do
      transitions from: :draft, to: :published
    end

    event :drafting do
      transitions from: %i[published shared], to: :draft
    end

    event :share do
      transitions from: %i[draft published], to: :shared
    end
end

```

## Versioning

Your model have a versioning notion now.
Read paper_trail doc before: https://github.com/paper-trail-gem/paper_trail

```
document = Document.create!(name: "test")
document.versions.count #=> 1

document.files.attach(io: File.open('/path/to/file'), filename: 'file.pdf', content_type: 'application/pdf')
document.versions.count #=> 2
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
