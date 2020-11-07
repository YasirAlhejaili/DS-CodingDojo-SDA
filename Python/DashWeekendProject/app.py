import dash
import dash_core_components as dcc
import dash_html_components as html
from dash.dependencies import Input, Output
import pandas as pd
import plotly.express as px

external_stylesheets = ['https://codepen.io/chriddyp/pen/bWLwgP.css']

app = dash.Dash(__name__, external_stylesheets=external_stylesheets)

# assume you have a "long-form" data frame
# see https://plotly.com/python/px-arguments/ for more options
df = pd.read_csv('https://raw.githubusercontent.com/daniel-dc-cd/data_science/master/module_3_Python/data/titanic.csv')
df["Survived"] = df["Survived"].replace([0],"Didn't Survived")
df["Survived"] = df["Survived"].replace([1],"Did Survived")


fig1 = px.scatter(df, x="Age", y="Fare",
                 color="Pclass",
                 log_x=False)

fig2 = px.violin(df, y="Age", x="Survived", color="Sex", box=True, points="all", hover_data=df.columns)

fig3 = px.histogram(df, x="Survived", color="Pclass")

fig4 = px.histogram(df, x="Survived", color="Sex")

app.layout = html.Div(children=[
    # All elements from the top of the page
    html.Div([
        html.H1(children='Yasir Alhejaili Project'),

        html.Div(children='''
            A scatter plot to see the relation between Age , Fare and each class
        '''),

        dcc.Graph(
            id='graph1',
            figure=fig1
        ),  
    ]),
    # New Div for all elements in the new 'row' of the page
    html.Div([
        html.Div(children='''
            Plot to see who survived and there age
        '''),

        dcc.Graph(
            id='graph2',
            figure=fig2
        ),  
    ]),
    # New Div for all elements in the new 'row' of the page
    html.Div([
        html.Div(children='''
            Plot to count who survived and did not according to there Pclass.
        '''),

        dcc.Graph(
            id='graph3',
            figure=fig3
        ),  
    ]),
    # New Div for all elements in the new 'row' of the page
    html.Div([
        html.Div(children='''
            Plot to count who survived and did not according to there gender.
        '''),

        dcc.Graph(
            id='graph4',
            figure=fig4
        ),  
    ]),
])

if __name__ == '__main__':
    app.run_server(debug=True)