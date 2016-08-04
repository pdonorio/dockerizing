
# Jupyter and RethinkBD

A mix of the power of notebook and the amazing [rethinkdb](http://rethinkdb.com/) database.

### How to test

```bash
# Build the image
docker build -t testing .

# Run the notebook
docker run -it -p 80:8888 testing
```

Then access [http://localhost](http://localhost).

In a new jupyter terminal run:
```bash
$ rethinkdb
```

While in a notebook you may test the connection with:
```python
# import the library
import rethinkdb as r
# connect to local rethinkdb
r.connect().repl()
# list available databases
r.db_list().run()
```
