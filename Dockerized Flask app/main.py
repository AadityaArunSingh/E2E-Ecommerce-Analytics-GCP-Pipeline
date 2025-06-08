# https://queries-7xrnyfweoa-uc.a.run.app/

# import libraries
from flask import Flask, render_template, request
from google.cloud import bigquery

# initialise flask app
app = Flask(__name__)
client = bigquery.Client(project="cc-coursework-456415")

# queries
@app.route("/", methods=["GET", "POST"])
def index():
    results = None
    query_type = request.form.get("query_type") if request.method == "POST" else None

    if query_type == "query1":
        query = """
            SELECT id, name
            FROM `cc-coursework-456415.thelook.distribution_centers`
            ORDER BY id
        """
        results = client.query(query).to_dataframe()

    elif query_type == "query2":
        query = """
            SELECT category,
            AVG(cost) as avg_cost,
            MIN(cost) as min_cost,
            MAX(cost) as max_cost
            FROM `cc-coursework-456415.thelook.products`
            GROUP BY 
            category
            ORDER BY 
            avg_cost DESC
        """
        results = client.query(query).to_dataframe()

    return render_template("index.html", results=results, query_type=query_type)

if __name__ == "__main__":
    import os
    port = int(os.environ.get("PORT", 8080))  
    app.run(host="0.0.0.0", port=port, debug=True)


