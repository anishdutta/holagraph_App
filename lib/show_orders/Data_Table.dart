class User{
  String Orders;
  String time_date;
  String Total_cost;
  String Shop_name;
  String status;

  User({this.Orders, this.Shop_name, this.status, this.time_date, this.Total_cost});

  static List<User> getUsers(){
    return <User>[
      User(Orders: '6', time_date: '15/2', Total_cost: '₹ 55', Shop_name: 'Shop', status: 'Delivered'),
      User(Orders: '8', time_date: '1/2', Total_cost: '₹ 55', Shop_name: 'Shop', status: 'Delivered'),
      User(Orders: '5', time_date: '15/2', Total_cost: '₹ 55', Shop_name: 'Shop', status: 'Delivered'),
      User(Orders: '10', time_date: '15/2', Total_cost: '₹ 55', Shop_name: 'Shop', status: 'Delivered'),
      User(Orders: '15', time_date: '15/2', Total_cost: '₹ 55', Shop_name: 'Shop', status: 'Delivered'),
      User(Orders: '16', time_date: '15/2', Total_cost: '₹ 55', Shop_name: 'Shop', status: 'Delivered'),
      User(Orders: '9', time_date: '15/2', Total_cost: '₹ 55', Shop_name: 'Shop', status: 'Delivered'),
      User(Orders: '10', time_date: '15/2', Total_cost: '₹ 55', Shop_name: 'Shop', status: 'Delivered'),
      User(Orders: '8', time_date: '15/2', Total_cost: '₹ 55', Shop_name: 'Shop', status: 'Delivered'),
      User(Orders: '4', time_date: '15/2', Total_cost: '₹ 55', Shop_name: 'Shop', status: 'Delivered'),
      User(Orders: '3', time_date: '15/2', Total_cost: '₹ 55', Shop_name: 'Shop', status: 'Delivered'),

    ];
  }
}