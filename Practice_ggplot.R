
# Dataset creation
# we have created 7 columns
# first column is order_id which is integer type
# Products, Category, region are string datatype
# we define units sold and unit price as integer type
# we define sales date as date type
sales_data <- data.frame(
  
  order_id = c(101,102,103,104,105,106,107,108,109,110,111,112,113,114,115),
  
  product = c("Laptop","Mobile","Tablet","Laptop","Mobile",
              "Tablet","Laptop","Mobile","Tablet","Laptop",
              "Mobile","Tablet","Laptop","Mobile","Tablet"),
  
  category = c("Electronics","Electronics","Electronics","Electronics","Electronics",
               "Electronics","Electronics","Electronics","Electronics","Electronics",
               "Electronics","Electronics","Electronics","Electronics","Electronics"),
  
  region = c("North","South","East","West","North",
             "South","East","West","North","South",
             "East","West","North","South","East"),
  
  units_sold = c(5,8,3,6,10,4,7,9,2,11,6,5,8,12,4),
  
  unit_price = c(800,500,300,820,520,310,790,510,305,830,495,315,810,530,320),
  
  sales_date = as.Date(c("2024-01-05","2024-01-08","2024-01-10",
                         "2024-01-12","2024-01-15","2024-01-18",
                         "2024-01-20","2024-01-22","2024-01-25",
                         "2024-01-28","2024-02-01","2024-02-03",
                         "2024-02-05","2024-02-08","2024-02-10"))
)
View(sales_data)

# step 1 (install library and import)
# library is already installed so just import that
library(ggplot2)
head(sales_data)
summary(sales_data)

# step 2: Draw geom point graph D= data M= mapping G=graph
# define Data which is sales_data and aes order_id, units_sold and graph is geom_point
ggplot(data=sales_data, aes(x= order_id, y=unit_price)) + geom_point()
ggplot(sales_data, aes(x=order_id, y=units_sold)) + geom_point() 

# step 3: Adding colors based on region
# adding theme and facet_wrap
# when we have to define some basic colors like red blue green etc so we will pass
# these colors in "red" or 'red'
ggplot(data=sales_data, aes(x= order_id, y=unit_price, colour=region)) + geom_point()


ggplot(sales_data, aes(x=order_id, y=unit_price, colour = region)) + 
  geom_point() + 
  theme_light() +
  facet_wrap('product')




# step 4: Adding labs layer (labs layer contains title, x-label and y-label)
ggplot(sales_data, aes(x=sales_date, y=units_sold, colour = product)) + 
  geom_point() +
  theme_dark() +
  labs(title="Items soled by date", x="Date", y="Unit Sold")

# step 5: Please add size of dots and define fix color
ggplot(sales_data, aes(x=sales_date, y=unit_price, colour = 'red', size= product)) + 
  geom_point() +
  theme_light() +
  labs(title="Items soled by date", x="Date", y="Unit Sold")

# step 6: change shape of dots
# added size of dots and define fix color
ggplot(sales_data, aes(x=sales_date, y=unit_price, colour = product, shape = factor(product))) + 
  geom_point() +
  theme_light() +
  labs(title="Items soled by date", x="Date", y="Unit Sold") +
  geom_smooth(method=lm)

############################ Bar graph ###########################
# when we do not use stat='identity' this will by default get counts
# for example in simple bar chart to display product count
# and when we get only units sold it counts only
# simple bar chart
ggplot(sales_data, aes(x = units_sold)) + 
  geom_bar()

# bar chart with color and draw how many unique products of each category
ggplot(sales_data, aes(x = product, fill = product)) + 
  geom_bar()

# Now we will check how many product sold of each type like how much mobiles sold etc.
ggplot(sales_data, aes(x = product, y = units_sold, fill = product)) + 
  geom_bar(stat = "identity") +
  theme_light() +
  labs(
    title = "Total Units Sold by Product",
    x = "Product",
    y = "Units Sold"
  )

# Now we will create histogram
# scale x continous means x axis should be gap of 2 from minimum value of units sold to maximum units sold
# units_sold = c(5,8,3,6,10,4,7,9,2,11,6,5,8,12,4) min sold units are 2 and max are 12
# Calculate table Bin	Values Inside	Frequency
# 2–4  |	2, 3	    | 2
# 4–6	 | 4, 4, 5, 5	| 4
# 6–8	 | 6, 6, 7	  | 3
# 8–10 | 8, 8, 9	  | 3
# 10–12|	10, 11	  | 2
# 12–14|	12	      | 1
ggplot(sales_data, aes(x = units_sold)) +
  geom_histogram(binwidth = 2, fill = "skyblue", color = "black") +
  theme_minimal() +
  scale_x_continuous(breaks = seq(min(sales_data$units_sold),
                                  max(sales_data$units_sold),
                                  by = 2)) +
  labs(
    title = "Distribution of Units Sold",
    x = "Units Sold",
    y = "Frequency"
  )

# Area chart

ggplot(sales_data, aes(x = order_id, y = units_sold, fill = region)) +
  geom_area(alpha = 0.7, color = "black", size = 0.3) +
  theme_minimal() +
  labs(
    title = "Units Sold Trend by Region",
    x = "Order ID",
    y = "Units Sold"
  ) +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold", size = 14),
    legend.position = "top"
  )

# sales of each product
sales_data['Sales'] <- sales_data['units_sold'] * sales_data['unit_price']
View(sales_data)

ggplot(data=sales_data, aes(x=product, y=Sales, fill = product))+
  geom_bar(stat='identity')+
  labs(
    title="Sales by each Product", x="Product", y="Sales by each product"
  )+
  theme(
    plot.title = element_text(hjust = 0.5, face='bold', size=15),
    legend.position = "bottom"
  )
  


