\name{forecast.mlm}
\alias{forecast.mlm}
\title{Forecast a multiple linear model with possible time series components}
\usage{\method{forecast}{mlm}(object, newdata, h = 10, level = c(80, 95), 
    fan = FALSE, lambda = object$lambda, biasadj = FALSE, ts = TRUE, ...)
}

\arguments{
\item{object}{Object of class "mlm", usually the result of a call to \code{\link[stats]{lm}} or \code{\link{tslm}}.}
\item{newdata}{An optional data frame in which to look for variables with which to predict. If omitted, it is assumed that the only variables are trend and season, and \code{h} forecasts are produced.}
\item{level}{Confidence level for prediction intervals.}
\item{fan}{If \code{TRUE}, level is set to seq(51,99,by=3). This is suitable for fan plots.}
\item{h}{Number of periods for forecasting. Ignored if \code{newdata} present.}
\item{lambda}{Box-Cox transformation parameter. Ignored if \code{NULL}. Otherwise, forecasts back-transformed via an inverse Box-Cox transformation.}
\item{biasadj}{Use adjusted back-transformed mean for Box-Cox transformations. If TRUE, point forecasts and fitted values are mean forecast. Otherwise, these points can be considered the median of the forecast densities.}
\item{ts}{If \code{TRUE}, the forecasts will be treated as time series provided the original data is a time series; the \code{newdata} will be interpreted as related to the subsequent time periods. If \code{FALSE}, any time series attributes of the original data will be ignored.}
\item{...}{Other arguments passed to \code{\link[forecast]{forecast.lm}()}.}
}

\description{\code{forecast.mlm} is used to predict multiple linear models, especially those involving trend and seasonality components.}

\details{\code{forecast.mlm} is largely a wrapper for \code{\link[forecast]{forecast.lm}()} except that it allows forecasts to be generated on multiple series. Also, the output is reformatted into a \code{mforecast} object.}


\value{An object of class "\code{mforecast}".

The function \code{summary} is used to obtain and print a summary of the
results, while the function \code{plot} produces a plot of the forecasts and prediction intervals.

The generic accessor functions \code{fitted.values} and \code{residuals} extract useful features of the value returned by \code{forecast.lm}.

An object of class \code{"mforecast"} is a list containing at least the following elements:
\item{model}{A list containing information about the fitted model}
\item{method}{The name of the forecasting method as a character string}
\item{mean}{Point forecasts as a multivariate time series}
\item{lower}{Lower limits for prediction intervals of each series}
\item{upper}{Upper limits for prediction intervals of each series}
\item{level}{The confidence values associated with the prediction intervals}
\item{x}{The historical data for the response variable.}
\item{residuals}{Residuals from the fitted model. That is x minus fitted values.}
\item{fitted}{Fitted values}
}

\seealso{\code{\link{tslm}}, \code{\link{forecast.lm}}, \code{\link[stats]{lm}}.}

\author{Mitchell O'Hara-Wild}

\examples{
lungDeaths <- cbind(mdeaths, fdeaths)
fit <- tslm(lungDeaths ~ trend + season)
fcast <- forecast(fit, h=10)

carPower <- as.matrix(mtcars[,c("qsec","hp")])
carmpg <- mtcars[,"mpg"]
fit <- lm(carPower ~ carmpg)
fcast <- forecast(fit, newdata=data.frame(carmpg=30))
}
