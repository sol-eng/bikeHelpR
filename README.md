
<!-- README.md is generated from README.Rmd. Please edit that file -->

# bikeHelpR

Helpful functions for interacting with data from
<https://capitalbikeshare.com> and for use with the RStudio Bike
Prediction example
(<https://solutions.rstudio.com/example/bike_predict/>).

-   Source code: <https://github.com/sol-eng/bikeHelpR>
-   RStudio Package Manager:
    <https://packagemanager.rstudio.com/client/#/repos/1/packages/bikeHelpR>

## Installation

Install bikeHelpR from [RStudio Package
Manager](https://packagemanager.rstudio.com/client/#/repos/1/packages/bikeHelpR).

``` r
install.packages("bikeHelpR", repos = "https://packagemanager.rstudio.com/all/latest")
```

Install the latest development version of bikeHelpR from GitHub.

``` r
# install.packages("devtools")
devtools::install_github("sol-eng/bikeHelpR")
```

## Example

Check out the list of available data feeds:

``` r
library(bikeHelpR)

feeds <- feeds_urls()
print(feeds)
#> # A tibble: 8 × 3
#>   name                url                                                last_updated       
#>   <chr>               <chr>                                              <dttm>             
#> 1 system_information  https://gbfs.capitalbikeshare.com/gbfs/en/system_… 2022-05-24 17:56:40
#> 2 station_information https://gbfs.capitalbikeshare.com/gbfs/en/station… 2022-05-24 17:56:40
#> 3 station_status      https://gbfs.capitalbikeshare.com/gbfs/en/station… 2022-05-24 17:56:40
#> 4 free_bike_status    https://gbfs.capitalbikeshare.com/gbfs/en/free_bi… 2022-05-24 17:56:40
#> 5 system_hours        https://gbfs.capitalbikeshare.com/gbfs/en/system_… 2022-05-24 17:56:40
#> 6 system_calendar     https://gbfs.capitalbikeshare.com/gbfs/en/system_… 2022-05-24 17:56:40
#> 7 system_regions      https://gbfs.capitalbikeshare.com/gbfs/en/system_… 2022-05-24 17:56:40
#> 8 system_alerts       https://gbfs.capitalbikeshare.com/gbfs/en/system_… 2022-05-24 17:56:40
```

Get the latest data from the station_status feed:

``` r
url <- feeds |> 
  dplyr::filter(name == "station_status") |> 
  dplyr::pull(url)

station_status <- get_data(url)
dplyr::glimpse(station_status)
#> List of 3
#>  $ last_updated: POSIXct[1:1], format: "2022-05-24 17:57:05"
#>  $ ttl         : int 5
#>  $ data        : tibble [681 × 13] (S3: tbl_df/tbl/data.frame)
#>   ..$ is_installed             : int [1:681] 1 1 1 1 1 1 1 1 1 1 ...
#>   ..$ num_docks_disabled       : int [1:681] 0 0 0 0 0 0 0 0 0 0 ...
#>   ..$ is_returning             : int [1:681] 1 1 1 1 1 1 1 1 1 1 ...
#>   ..$ eightd_has_available_keys: logi [1:681] FALSE FALSE FALSE FALSE FALSE FALSE ...
#>   ..$ station_id               : chr [1:681] "1" "3" "4" "5" ...
#>   ..$ last_reported            : int [1:681] 1653396624 1653407492 1653410286 1653402738 1653410778 1653409022 1653410199 1653411718 1653409213 1653411965 ...
#>   ..$ station_status           : chr [1:681] "active" "active" "active" "active" ...
#>   ..$ num_bikes_disabled       : int [1:681] 0 1 0 0 0 0 0 0 0 0 ...
#>   ..$ num_docks_available      : int [1:681] 5 7 2 3 14 5 9 12 9 5 ...
#>   ..$ legacy_id                : chr [1:681] "1" "3" "4" "5" ...
#>   ..$ is_renting               : int [1:681] 1 1 1 1 1 1 1 1 1 1 ...
#>   ..$ num_ebikes_available     : int [1:681] 0 1 2 0 0 0 0 0 0 1 ...
#>   ..$ num_bikes_available      : int [1:681] 10 9 14 9 5 11 10 0 2 12 ...
#>  - attr(*, "class")= chr "bike_data"
```

## Contributing

### Updating the docs

Regenerate the README using:

``` r
devtools::load_all()
rmarkdown::render("README.Rmd", "all")
```
