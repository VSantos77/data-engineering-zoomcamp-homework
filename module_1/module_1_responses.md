# Module 1 Homework Submission

---

## Question 1

Run the docker image with python version 3.13:

`docker run -it --entrypoint=bash python:3.13`

Get pip version:

`pip -V`

Output

```
root@58376df11568:/# pip -V
pip 25.3 from /usr/local/lib/python3.13/site-packages/pip (python 3.13)
```

**A: 25.3**

---

## Question 2

The answer is *postgres:5432*. 
- Host name: *postgres* is the container name within the network.
- Port: likewise, pgadmin can connect directly to postgres using internal port 5432. Local PC port 5433 is not needed.

**A: postgres:5432**

---

## Questions 3,4,5,6

Refer to [Jupyter Notebook](./module_1_taxi_dataset/module_1_taxi_dataset_notebook.ipynb)

## Question 7


**A: terraform init, terraform apply -auto-approve, terraform destroy**