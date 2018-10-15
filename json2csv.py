import pandas as pd
from json import load
from datetime import datetime

final_dataframe_with_lasers = pd.DataFrame()

for year in range(2003,2018):
    for i in range(1,60):
        try:
            file_name = '%s/%s/master.json' % (year, i)
            with open(file_name) as f:
                data = load(f)
            a = pd.DataFrame.from_dict(data['lstEmpenhos'])
            print('reading')
            final_dataframe_with_lasers = pd.concat([final_dataframe_with_lasers, a], ignore_index=True)
            print('PAGE %s YEAR %s WRITTEN' % (i, year))
        except Exception as err:
            if err == 2:
                print('end of folder')
                continue
            else:
                print(err)
final_dataframe_with_lasers.to_csv(path_or_buf=f'empenhos_dezembro_{datetime.now()}.csv',index=False)
final_dataframe_with_lasers.to_excel(excel_writer=f'empenhos_dezembro_{datetime.now()}.xlsx',index=False)
