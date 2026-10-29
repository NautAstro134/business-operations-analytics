# Dataset placement

Download the DataCo SMART Supply Chain dataset from the original Mendeley Data record:

https://data.mendeley.com/datasets/8gx2fvg2k6/1

Place the source file at:

`data/raw/DataCoSupplyChainDataset.csv`

Then run:

`python scripts/prepare_safe_dataset.py`

The processed file excludes customer email, password, street address, first name, last name, latitude, and longitude.
