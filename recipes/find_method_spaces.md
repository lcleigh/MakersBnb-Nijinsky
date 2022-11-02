# GET /albums Route Design Recipe

_Copy this design recipe template to test-drive a Sinatra route._

## 1. Design the Route Signature

You'll need to include:
  
method: GET
path: /spaces/:id

  

## 2. Design the Response

response = (200 OK)
#Select a space:
Treehouse

```

## 3. Write Examples

```
# Request:

GET /spaces/:id

expect response = (200 OK)
expect:
Treehouse 
Details of listing
# Expected response:

Response for 200 OK

```

## 4. Encode as Tests Examples

```ruby

```


  context 'GET /spaces/:id' do
    it 'returns info about space at index 1' do
      response = get('/spaces/1')
      expect(response.status).to eq(200)
      expect(response.body).to include ('<h1>Treehouse</h1>')
      expect(response.body).to include ('Price: 200')
      expect(response.body).to include ('Sleep in the trees.')
    end

    it 'returns info about a space at index 2' do
      response = get('/spaces/2')
      expect(response.status).to eq(200)
      expect(response.body).to include ('<h1>Lighthouse</h1>')
      expect(response.body).to include ('Price: 350')
      expect(response.body).to include ('Views of the sea.')
    end
  end
## 5. Implement the Route

Write the route and web server code to implement the route behaviour.

