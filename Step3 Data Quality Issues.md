# Step 3. Evaluate Data Quality Issues in the Data Provided

### 1. read the data in dataframes


```python
import pandas as pd

brands = pd.read_json('data/brands.json',lines=True)
receipts = pd.read_json('data/receipts.json',lines=True)
users = pd.read_json('data/users.json',lines=True)
```

###  2. take a look at the data 


```python
brands.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>_id</th>
      <th>barcode</th>
      <th>category</th>
      <th>categoryCode</th>
      <th>cpg</th>
      <th>name</th>
      <th>topBrand</th>
      <th>brandCode</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>{'$oid': '601ac115be37ce2ead437551'}</td>
      <td>511111019862</td>
      <td>Baking</td>
      <td>BAKING</td>
      <td>{'$id': {'$oid': '601ac114be37ce2ead437550'}, ...</td>
      <td>test brand @1612366101024</td>
      <td>0.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>1</th>
      <td>{'$oid': '601c5460be37ce2ead43755f'}</td>
      <td>511111519928</td>
      <td>Beverages</td>
      <td>BEVERAGES</td>
      <td>{'$id': {'$oid': '5332f5fbe4b03c9a25efd0ba'}, ...</td>
      <td>Starbucks</td>
      <td>0.0</td>
      <td>STARBUCKS</td>
    </tr>
    <tr>
      <th>2</th>
      <td>{'$oid': '601ac142be37ce2ead43755d'}</td>
      <td>511111819905</td>
      <td>Baking</td>
      <td>BAKING</td>
      <td>{'$id': {'$oid': '601ac142be37ce2ead437559'}, ...</td>
      <td>test brand @1612366146176</td>
      <td>0.0</td>
      <td>TEST BRANDCODE @1612366146176</td>
    </tr>
    <tr>
      <th>3</th>
      <td>{'$oid': '601ac142be37ce2ead43755a'}</td>
      <td>511111519874</td>
      <td>Baking</td>
      <td>BAKING</td>
      <td>{'$id': {'$oid': '601ac142be37ce2ead437559'}, ...</td>
      <td>test brand @1612366146051</td>
      <td>0.0</td>
      <td>TEST BRANDCODE @1612366146051</td>
    </tr>
    <tr>
      <th>4</th>
      <td>{'$oid': '601ac142be37ce2ead43755e'}</td>
      <td>511111319917</td>
      <td>Candy &amp; Sweets</td>
      <td>CANDY_AND_SWEETS</td>
      <td>{'$id': {'$oid': '5332fa12e4b03c9a25efd1e7'}, ...</td>
      <td>test brand @1612366146827</td>
      <td>0.0</td>
      <td>TEST BRANDCODE @1612366146827</td>
    </tr>
  </tbody>
</table>
</div>




```python
receipts.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>_id</th>
      <th>bonusPointsEarned</th>
      <th>bonusPointsEarnedReason</th>
      <th>createDate</th>
      <th>dateScanned</th>
      <th>finishedDate</th>
      <th>modifyDate</th>
      <th>pointsAwardedDate</th>
      <th>pointsEarned</th>
      <th>purchaseDate</th>
      <th>purchasedItemCount</th>
      <th>rewardsReceiptItemList</th>
      <th>rewardsReceiptStatus</th>
      <th>totalSpent</th>
      <th>userId</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>{'$oid': '5ff1e1eb0a720f0523000575'}</td>
      <td>500.0</td>
      <td>Receipt number 2 completed, bonus point schedu...</td>
      <td>{'$date': 1609687531000}</td>
      <td>{'$date': 1609687531000}</td>
      <td>{'$date': 1609687531000}</td>
      <td>{'$date': 1609687536000}</td>
      <td>{'$date': 1609687531000}</td>
      <td>500.0</td>
      <td>{'$date': 1609632000000}</td>
      <td>5.0</td>
      <td>[{'barcode': '4011', 'description': 'ITEM NOT ...</td>
      <td>FINISHED</td>
      <td>26.0</td>
      <td>5ff1e1eacfcf6c399c274ae6</td>
    </tr>
    <tr>
      <th>1</th>
      <td>{'$oid': '5ff1e1bb0a720f052300056b'}</td>
      <td>150.0</td>
      <td>Receipt number 5 completed, bonus point schedu...</td>
      <td>{'$date': 1609687483000}</td>
      <td>{'$date': 1609687483000}</td>
      <td>{'$date': 1609687483000}</td>
      <td>{'$date': 1609687488000}</td>
      <td>{'$date': 1609687483000}</td>
      <td>150.0</td>
      <td>{'$date': 1609601083000}</td>
      <td>2.0</td>
      <td>[{'barcode': '4011', 'description': 'ITEM NOT ...</td>
      <td>FINISHED</td>
      <td>11.0</td>
      <td>5ff1e194b6a9d73a3a9f1052</td>
    </tr>
    <tr>
      <th>2</th>
      <td>{'$oid': '5ff1e1f10a720f052300057a'}</td>
      <td>5.0</td>
      <td>All-receipts receipt bonus</td>
      <td>{'$date': 1609687537000}</td>
      <td>{'$date': 1609687537000}</td>
      <td>NaN</td>
      <td>{'$date': 1609687542000}</td>
      <td>NaN</td>
      <td>5.0</td>
      <td>{'$date': 1609632000000}</td>
      <td>1.0</td>
      <td>[{'needsFetchReview': False, 'partnerItemId': ...</td>
      <td>REJECTED</td>
      <td>10.0</td>
      <td>5ff1e1f1cfcf6c399c274b0b</td>
    </tr>
    <tr>
      <th>3</th>
      <td>{'$oid': '5ff1e1ee0a7214ada100056f'}</td>
      <td>5.0</td>
      <td>All-receipts receipt bonus</td>
      <td>{'$date': 1609687534000}</td>
      <td>{'$date': 1609687534000}</td>
      <td>{'$date': 1609687534000}</td>
      <td>{'$date': 1609687539000}</td>
      <td>{'$date': 1609687534000}</td>
      <td>5.0</td>
      <td>{'$date': 1609632000000}</td>
      <td>4.0</td>
      <td>[{'barcode': '4011', 'description': 'ITEM NOT ...</td>
      <td>FINISHED</td>
      <td>28.0</td>
      <td>5ff1e1eacfcf6c399c274ae6</td>
    </tr>
    <tr>
      <th>4</th>
      <td>{'$oid': '5ff1e1d20a7214ada1000561'}</td>
      <td>5.0</td>
      <td>All-receipts receipt bonus</td>
      <td>{'$date': 1609687506000}</td>
      <td>{'$date': 1609687506000}</td>
      <td>{'$date': 1609687511000}</td>
      <td>{'$date': 1609687511000}</td>
      <td>{'$date': 1609687506000}</td>
      <td>5.0</td>
      <td>{'$date': 1609601106000}</td>
      <td>2.0</td>
      <td>[{'barcode': '4011', 'description': 'ITEM NOT ...</td>
      <td>FINISHED</td>
      <td>1.0</td>
      <td>5ff1e194b6a9d73a3a9f1052</td>
    </tr>
  </tbody>
</table>
</div>




```python
users.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>_id</th>
      <th>active</th>
      <th>createdDate</th>
      <th>lastLogin</th>
      <th>role</th>
      <th>signUpSource</th>
      <th>state</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>{'$oid': '5ff1e194b6a9d73a3a9f1052'}</td>
      <td>True</td>
      <td>{'$date': 1609687444800}</td>
      <td>{'$date': 1609687537858}</td>
      <td>consumer</td>
      <td>Email</td>
      <td>WI</td>
    </tr>
    <tr>
      <th>1</th>
      <td>{'$oid': '5ff1e194b6a9d73a3a9f1052'}</td>
      <td>True</td>
      <td>{'$date': 1609687444800}</td>
      <td>{'$date': 1609687537858}</td>
      <td>consumer</td>
      <td>Email</td>
      <td>WI</td>
    </tr>
    <tr>
      <th>2</th>
      <td>{'$oid': '5ff1e194b6a9d73a3a9f1052'}</td>
      <td>True</td>
      <td>{'$date': 1609687444800}</td>
      <td>{'$date': 1609687537858}</td>
      <td>consumer</td>
      <td>Email</td>
      <td>WI</td>
    </tr>
    <tr>
      <th>3</th>
      <td>{'$oid': '5ff1e1eacfcf6c399c274ae6'}</td>
      <td>True</td>
      <td>{'$date': 1609687530554}</td>
      <td>{'$date': 1609687530597}</td>
      <td>consumer</td>
      <td>Email</td>
      <td>WI</td>
    </tr>
    <tr>
      <th>4</th>
      <td>{'$oid': '5ff1e194b6a9d73a3a9f1052'}</td>
      <td>True</td>
      <td>{'$date': 1609687444800}</td>
      <td>{'$date': 1609687537858}</td>
      <td>consumer</td>
      <td>Email</td>
      <td>WI</td>
    </tr>
  </tbody>
</table>
</div>



### 3. Check data quality

first, flatten the columns in brands table that has nested hash tables such as {'$oid': '5ff1e194b6a9d73a3a9f1052'}


```python
brands['_id'] = brands['_id'].apply(lambda x: x['$oid'])
brands['cpg_ref'] = brands['cpg'].apply(lambda x: x['$ref'])
brands['cpg'] = brands['cpg'].apply(lambda x: x['$id']['$oid'])
brands.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>_id</th>
      <th>barcode</th>
      <th>category</th>
      <th>categoryCode</th>
      <th>cpg</th>
      <th>name</th>
      <th>topBrand</th>
      <th>brandCode</th>
      <th>cpg_ref</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>601ac115be37ce2ead437551</td>
      <td>511111019862</td>
      <td>Baking</td>
      <td>BAKING</td>
      <td>601ac114be37ce2ead437550</td>
      <td>test brand @1612366101024</td>
      <td>0.0</td>
      <td>NaN</td>
      <td>Cogs</td>
    </tr>
    <tr>
      <th>1</th>
      <td>601c5460be37ce2ead43755f</td>
      <td>511111519928</td>
      <td>Beverages</td>
      <td>BEVERAGES</td>
      <td>5332f5fbe4b03c9a25efd0ba</td>
      <td>Starbucks</td>
      <td>0.0</td>
      <td>STARBUCKS</td>
      <td>Cogs</td>
    </tr>
    <tr>
      <th>2</th>
      <td>601ac142be37ce2ead43755d</td>
      <td>511111819905</td>
      <td>Baking</td>
      <td>BAKING</td>
      <td>601ac142be37ce2ead437559</td>
      <td>test brand @1612366146176</td>
      <td>0.0</td>
      <td>TEST BRANDCODE @1612366146176</td>
      <td>Cogs</td>
    </tr>
    <tr>
      <th>3</th>
      <td>601ac142be37ce2ead43755a</td>
      <td>511111519874</td>
      <td>Baking</td>
      <td>BAKING</td>
      <td>601ac142be37ce2ead437559</td>
      <td>test brand @1612366146051</td>
      <td>0.0</td>
      <td>TEST BRANDCODE @1612366146051</td>
      <td>Cogs</td>
    </tr>
    <tr>
      <th>4</th>
      <td>601ac142be37ce2ead43755e</td>
      <td>511111319917</td>
      <td>Candy &amp; Sweets</td>
      <td>CANDY_AND_SWEETS</td>
      <td>5332fa12e4b03c9a25efd1e7</td>
      <td>test brand @1612366146827</td>
      <td>0.0</td>
      <td>TEST BRANDCODE @1612366146827</td>
      <td>Cogs</td>
    </tr>
  </tbody>
</table>
</div>



check basic information


```python
brands.info()
```

    <class 'pandas.core.frame.DataFrame'>
    RangeIndex: 1167 entries, 0 to 1166
    Data columns (total 9 columns):
     #   Column        Non-Null Count  Dtype  
    ---  ------        --------------  -----  
     0   _id           1167 non-null   object 
     1   barcode       1167 non-null   int64  
     2   category      1012 non-null   object 
     3   categoryCode  517 non-null    object 
     4   cpg           1167 non-null   object 
     5   name          1167 non-null   object 
     6   topBrand      555 non-null    float64
     7   brandCode     933 non-null    object 
     8   cpg_ref       1167 non-null   object 
    dtypes: float64(1), int64(1), object(7)
    memory usage: 82.2+ KB
    


```python
brands['category'].value_counts()
```




    Baking                         369
    Beer Wine Spirits               90
    Snacks                          75
    Candy & Sweets                  71
    Beverages                       63
    Health & Wellness               44
    Magazines                       44
    Breakfast & Cereal              40
    Grocery                         39
    Dairy                           33
    Condiments & Sauces             27
    Frozen                          24
    Personal Care                   20
    Baby                            18
    Canned Goods & Soups            12
    Beauty                           9
    Cleaning & Home Improvement      6
    Deli                             6
    Beauty & Personal Care           6
    Bread & Bakery                   5
    Dairy & Refrigerated             5
    Household                        5
    Outdoor                          1
    Name: category, dtype: int64




```python
brands['topBrand'].value_counts()
```




    0.0    524
    1.0     31
    Name: topBrand, dtype: int64




```python
brands['cpg_ref'].value_counts()
```




    Cogs    1020
    Cpgs     147
    Name: cpg_ref, dtype: int64



check duplicates


```python
# check if primary key is unique
brands[brands.duplicated(['_id'], keep=False)]
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>_id</th>
      <th>barcode</th>
      <th>category</th>
      <th>categoryCode</th>
      <th>cpg</th>
      <th>name</th>
      <th>topBrand</th>
      <th>brandCode</th>
      <th>cpg_ref</th>
    </tr>
  </thead>
  <tbody>
  </tbody>
</table>
</div>




```python
brands[brands.duplicated()]
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>_id</th>
      <th>barcode</th>
      <th>category</th>
      <th>categoryCode</th>
      <th>cpg</th>
      <th>name</th>
      <th>topBrand</th>
      <th>brandCode</th>
      <th>cpg_ref</th>
    </tr>
  </thead>
  <tbody>
  </tbody>
</table>
</div>



check missing value


```python
def check_missing(df):
    total_num = len(df)
    for column in df.columns:
        missing_count = df[column].isna().sum()
        missing_percent = round(missing_count/total_num,2)
        print(column, '\n missing_count: ', missing_count,'missing_percent: ',missing_percent)
```


```python
check_missing(brands)
```

    _id 
     missing_count:  0 missing_percent:  0.0
    barcode 
     missing_count:  0 missing_percent:  0.0
    category 
     missing_count:  155 missing_percent:  0.13
    categoryCode 
     missing_count:  650 missing_percent:  0.56
    cpg 
     missing_count:  0 missing_percent:  0.0
    name 
     missing_count:  0 missing_percent:  0.0
    topBrand 
     missing_count:  612 missing_percent:  0.52
    brandCode 
     missing_count:  234 missing_percent:  0.2
    cpg_ref 
     missing_count:  0 missing_percent:  0.0
    

So the data in 'brands' dataset are all unique, but there are some missing values. Some missing features inculd 'category', 'categoryCode',  'topBrand' and 'brandCode'. The 'categoryCode' has the most missing values, more than half of the record does not include 'categoryCode'. 


```python
# flatten the user id which potentially can be a primary key
users['_id'] = users['_id'].apply(lambda x: x['$oid'])
users.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>_id</th>
      <th>active</th>
      <th>createdDate</th>
      <th>lastLogin</th>
      <th>role</th>
      <th>signUpSource</th>
      <th>state</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>5ff1e194b6a9d73a3a9f1052</td>
      <td>True</td>
      <td>{'$date': 1609687444800}</td>
      <td>{'$date': 1609687537858}</td>
      <td>consumer</td>
      <td>Email</td>
      <td>WI</td>
    </tr>
    <tr>
      <th>1</th>
      <td>5ff1e194b6a9d73a3a9f1052</td>
      <td>True</td>
      <td>{'$date': 1609687444800}</td>
      <td>{'$date': 1609687537858}</td>
      <td>consumer</td>
      <td>Email</td>
      <td>WI</td>
    </tr>
    <tr>
      <th>2</th>
      <td>5ff1e194b6a9d73a3a9f1052</td>
      <td>True</td>
      <td>{'$date': 1609687444800}</td>
      <td>{'$date': 1609687537858}</td>
      <td>consumer</td>
      <td>Email</td>
      <td>WI</td>
    </tr>
    <tr>
      <th>3</th>
      <td>5ff1e1eacfcf6c399c274ae6</td>
      <td>True</td>
      <td>{'$date': 1609687530554}</td>
      <td>{'$date': 1609687530597}</td>
      <td>consumer</td>
      <td>Email</td>
      <td>WI</td>
    </tr>
    <tr>
      <th>4</th>
      <td>5ff1e194b6a9d73a3a9f1052</td>
      <td>True</td>
      <td>{'$date': 1609687444800}</td>
      <td>{'$date': 1609687537858}</td>
      <td>consumer</td>
      <td>Email</td>
      <td>WI</td>
    </tr>
  </tbody>
</table>
</div>



check basic information


```python
users.info()
```

    <class 'pandas.core.frame.DataFrame'>
    RangeIndex: 495 entries, 0 to 494
    Data columns (total 7 columns):
     #   Column        Non-Null Count  Dtype 
    ---  ------        --------------  ----- 
     0   _id           495 non-null    object
     1   active        495 non-null    bool  
     2   createdDate   495 non-null    object
     3   lastLogin     433 non-null    object
     4   role          495 non-null    object
     5   signUpSource  447 non-null    object
     6   state         439 non-null    object
    dtypes: bool(1), object(6)
    memory usage: 23.8+ KB
    


```python
users['active'].value_counts()
```




    True     494
    False      1
    Name: active, dtype: int64



The user data are pretty imbalanced


```python
users['role'].value_counts()
```




    consumer       413
    fetch-staff     82
    Name: role, dtype: int64




```python
users['signUpSource'].value_counts()
```




    Email     443
    Google      4
    Name: signUpSource, dtype: int64




```python
users['state'].value_counts()
```




    WI    396
    NH     20
    AL     12
    OH      5
    IL      3
    CO      1
    KY      1
    SC      1
    Name: state, dtype: int64



check duplicates


```python
users[users.duplicated(['_id'], keep=False)]
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>_id</th>
      <th>active</th>
      <th>createdDate</th>
      <th>lastLogin</th>
      <th>role</th>
      <th>signUpSource</th>
      <th>state</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>5ff1e194b6a9d73a3a9f1052</td>
      <td>True</td>
      <td>{'$date': 1609687444800}</td>
      <td>{'$date': 1609687537858}</td>
      <td>consumer</td>
      <td>Email</td>
      <td>WI</td>
    </tr>
    <tr>
      <th>1</th>
      <td>5ff1e194b6a9d73a3a9f1052</td>
      <td>True</td>
      <td>{'$date': 1609687444800}</td>
      <td>{'$date': 1609687537858}</td>
      <td>consumer</td>
      <td>Email</td>
      <td>WI</td>
    </tr>
    <tr>
      <th>2</th>
      <td>5ff1e194b6a9d73a3a9f1052</td>
      <td>True</td>
      <td>{'$date': 1609687444800}</td>
      <td>{'$date': 1609687537858}</td>
      <td>consumer</td>
      <td>Email</td>
      <td>WI</td>
    </tr>
    <tr>
      <th>3</th>
      <td>5ff1e1eacfcf6c399c274ae6</td>
      <td>True</td>
      <td>{'$date': 1609687530554}</td>
      <td>{'$date': 1609687530597}</td>
      <td>consumer</td>
      <td>Email</td>
      <td>WI</td>
    </tr>
    <tr>
      <th>4</th>
      <td>5ff1e194b6a9d73a3a9f1052</td>
      <td>True</td>
      <td>{'$date': 1609687444800}</td>
      <td>{'$date': 1609687537858}</td>
      <td>consumer</td>
      <td>Email</td>
      <td>WI</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>490</th>
      <td>54943462e4b07e684157a532</td>
      <td>True</td>
      <td>{'$date': 1418998882381}</td>
      <td>{'$date': 1614963143204}</td>
      <td>fetch-staff</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>491</th>
      <td>54943462e4b07e684157a532</td>
      <td>True</td>
      <td>{'$date': 1418998882381}</td>
      <td>{'$date': 1614963143204}</td>
      <td>fetch-staff</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>492</th>
      <td>54943462e4b07e684157a532</td>
      <td>True</td>
      <td>{'$date': 1418998882381}</td>
      <td>{'$date': 1614963143204}</td>
      <td>fetch-staff</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>493</th>
      <td>54943462e4b07e684157a532</td>
      <td>True</td>
      <td>{'$date': 1418998882381}</td>
      <td>{'$date': 1614963143204}</td>
      <td>fetch-staff</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>494</th>
      <td>54943462e4b07e684157a532</td>
      <td>True</td>
      <td>{'$date': 1418998882381}</td>
      <td>{'$date': 1614963143204}</td>
      <td>fetch-staff</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
  </tbody>
</table>
<p>353 rows × 7 columns</p>
</div>



So users dataset not only has duplicated user ids but also duplicated rows


```python
print('duplicated user id rate:', round(len(users[users.duplicated(['_id'], keep=False)])/len(users),2))
```

    duplicated user id rate: 0.71
    

check missing value


```python
check_missing(users)
```

    _id 
     missing_count:  0 missing_percent:  0.0
    active 
     missing_count:  0 missing_percent:  0.0
    createdDate 
     missing_count:  0 missing_percent:  0.0
    lastLogin 
     missing_count:  62 missing_percent:  0.13
    role 
     missing_count:  0 missing_percent:  0.0
    signUpSource 
     missing_count:  48 missing_percent:  0.1
    state 
     missing_count:  56 missing_percent:  0.11
    

The users dataset also has missing value in some features, inculding 'lastLogin', 'signUpSource', and 'state'. 

So far I have check the brands and users datasets and they both have data quality issue of missing values, and users dataset also contains about 71% of duplicated user Ids. 
