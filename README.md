# futbolR

A R package for retrieving statistics for the beautiful game.

## Using Python within RSutdio

Installing Python packages in RStudio is a bit tricky. The following steps will help you install Python packages in RStudio.

1. Install the `reticulate` package in RStudio.

```r
install.packages("reticulate")
```

2. Load the `reticulate` package.

```r
library(reticulate)
```

3. Use the `py_install` function to install Python packages.


```r
py_install("pandas")
```

4. Use the `py_module_available` function to check if a Python package is available.

```r
py_module_available("pandas")
```

5. Use the `py_module_available` function to check if a Python package is available.

```r
py_module_available("pandas")
```


Deterine which version of Python is being used in RStudio.

```r
print(reticulate::py_config())
```

If you want to use a different version of Python, you can specify the path to the Python executable using the `use_python` function.

```r
use_python("/path/to/python")
```

At this point you will need to restart the R session in RStudio.  Once this
is done you can simply use the version of python you previously specified by 
doing this

```r
library(reticulate)

print(reticulate::py_config())
```

You should now see the version of python you specified.





