from requests import request
from json import dump
from pandas import DataFrame, concat
import os

def getFiles():

   final_dataframe_with_lasers = DataFrame()

   url = "https://gatewayapi.prodam.sp.gov.br:443/financas/orcamento/sof/v2.1.0/consultaEmpenhos"

   headers = {

   'Authorization': "Bearer 4abf361f8c520e74728a0d51817bc4",

   'Cache-Control': "no-cache",

   }

   for year in range(2003,2018):

       for pagNum in range(1,61):

           querystring = {"anoEmpenho": year,"mesEmpenho":"12","codOrgao":"16","numPagina":pagNum}

           print("starting request year %s, pag %s..." % (year, pagNum))

           response = request("GET", url, headers=headers, params=querystring).json()

           panda_json = DataFrame.from_dict(response['lstEmpenhos'])

           final_dataframe_with_lasers = concat([final_dataframe_with_lasers, panda_json], ignore_index=True)

           print('data downloaded, writing file')

           fpath = '{ano}/{pagina}/master.json'.format(ano=year, pagina=pagNum)
           if not os.path.exists(os.path.dirname(fpath)):
               os.makedirs(os.path.dirname(fpath))

           with open(fpath, 'w') as outfile:
               dump(response, outfile)

           print('file written')

   final_dataframe_with_lasers.to_csv(path_or_buf='empenhos_dezembro.csv', index=False)

   final_dataframe_with_lasers.to_excel(excel_writer='empenhos_dezembro.xlsx', index=False)

if __name__ == '__main__':

   getFiles()
