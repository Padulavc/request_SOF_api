from requests import request
from json import dump
from pandas import DataFrame, concat
def getFiles():
    final_dataframe_with_lasers = DataFrame()
    url = "https://gatewayapi.prodam.sp.gov.br:443/financas/orcamento/sof/v2.1.0/consultaEmpenhos"
    headers = {
    'Authorization': "REPLACE",
    'Cache-Control': "no-cache",
    }
    for year in range(2015,2018):
        for pagNum in range(1,61):
            querystring = {"anoEmpenho": year,"mesEmpenho":"12","codOrgao":"16","numPagina":pagNum}
            print("starting request year %s, pag %s..." % (year, pagNum))
            response = request("GET", url, headers=headers, params=querystring).json()
            panda_json = DataFrame.from_dict(response['lstEmpenhos'])
            final_dataframe_with_lasers = concat([final_dataframe_with_lasers, panda_json], ignore_index=True)
            print('data downloaded, writing file')
            writefile = "master%s.json" % year
            with open(writefile, 'a') as outfile:
                dump(response, outfile)
            print('file written')
    final_dataframe_with_lasers.to_csv(path_or_buf=f'empenhos_dezembro.csv', index=False)
    final_dataframe_with_lasers.to_excel(excel_writer=f'empenhos_dezembro.xlsx', index=False)
if __name__ == '__main__':
    getFiles()
