library(ggplot2)

sales_data <- data.frame(
  product = c("A","B","C","D"),
  Sales = c(120,150,90,200),
  region = c("East","West","East","West")
)
ggplot(sales_data, aes(x=product, y=Sales, fill=region)) +
  
  geom_bar(stat="identity", color="black") +
  
  geom_text(aes(label=Sales)) +
  
  geom_smooth(aes(group=1), method="lm", se=FALSE, color="red") +
  
  labs(
    title="Product Sales Analysis",
    subtitle="Comparison of products by region",
    x="Products",
    y="Total Sales",
    fill="Region",
    caption="Source: Sales Dataset"
  ) +
  
  ggtitle("Sales Visualization") +
  
  theme_minimal() +
  
  theme(
    plot.title = element_text(size=18, face="bold", hjust=0.5),
    axis.text = element_text(size=12),
    legend.position = "top"
  ) +
  
  scale_y_continuous(breaks=c(0,50,100,150,200,250, 300, 350)) +
  
  scale_fill_manual(values=c("blue","orange")) +
  
  coord_cartesian(ylim=c(0,350)) +
  
  facet_wrap(~region) +
  
  annotate("text", x=2, y=220, label="Highest sales", color="red", size=5) +
  
  guides(fill=guide_legend(title="Sales Region 1"))