from json import load
import csv

months = ['01','02','03','04','05','06','07','08','09','10','11','12']

for year in range(2011,2019):
    for month in months:
        file_name = '%s/empenhos_%s_%s' % (year, year, month)
        json_name = '%s.json' % file_name
        csv_name = '%s.csv' % file_name
        f = open(json_name)
        data = load(f)
        f.close()
        with open(csv_name, 'w') as f:
            csv_file = csv.writer(f)
            keys = data.keys()
            for item in keys:
                csv_file.writerow(item)