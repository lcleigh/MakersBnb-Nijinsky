# POST /all_spaces Route Design Recipe

_Copy this design recipe template to test-drive a Sinatra route._

## 1. Design the Route Signature

You'll need to include:
  * the HTTP method
  * the path
  * any query parameters (passed in the URL)
  * or body parameters (passed in the request body)

  method: POST
  path: /all_spaces
  body parameters:
name
price
description
availability



## 2. Design the Response

The route might return different responses, depending on the result.

For example, a route for a specific blog post (by its ID) might return `200 OK` if the post exists, but `404 Not Found` if the post is not found in the database.

Your response might return plain text, JSON, or HTML code. 

_Replace the below with your own design. Think of all the different possible responses your route will return._

```
Expected response (200 OK)
(No content)
```



## 3. Write Examples

_Replace these with your own design._

```
# Request:

POST /albums?title=Voyage&release_year=2022&artist_id=2
POST /all_spaces?name=Greenhouse&price=150&description='Perfect for exhibitionists'&availability=linktoapi

# Expected response:

Response for 200 OK
```

```
# Request:

GET /all_spaces

# Expected response:

Response for 200 OK:
Treehouse
Lighthouse
Greenhouse
```

## 4. Encode as Tests Examples

```ruby
# EXAMPLE
# file: spec/integration/application_spec.rb

require "spec_helper"

describe AddSpace do
  include Rack::Test::Methods

  let(:app) { AddSpace.new }

  context "POST /all_spaces" do

    it 'should validate space parameters' do
        response = post('/all_spaces', invalid_name: "House", another_invalid_thing: 123, invalid_param: "Describe", incorrect: "linktoapi")

        expect(response.status).to eq 400
    end

    it 'returns a success page and creates a new space' do
        response = post('/all_spaces', name: 'Greenhouse', price: '150', description:'Perfect for exhibitionists', availability: 'linktoapi' )

        expect(response.status).to eq 200
        expect(response.body).to include 'Get ready to host! Your Space has been added.'

        response = get('/all_spaces')
    
        expect(response.body).to include 'Greenhouse'

    end
  end
end
```

## 5. Implement the Route

Write the route and web server code to implement the route behaviour.

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications&prefill_File=resources%2Fsinatra_route_design_recipe_template.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications&prefill_File=resources%2Fsinatra_route_design_recipe_template.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications&prefill_File=resources%2Fsinatra_route_design_recipe_template.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications&prefill_File=resources%2Fsinatra_route_design_recipe_template.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications&prefill_File=resources%2Fsinatra_route_design_recipe_template.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->