:- use_module(library(csv)).

read_csv_file(File, Columns, Rows):-
	csv_read_file(File, Rows, [functor(table), arity(Columns)]),
	maplist(assert, Rows).

save_to_file([], _).
save_to_file([H|T], FileName):-
	open(FileName, append, Stream), 
    write(Stream,H),
    write(Stream,'.\n'),
    close(Stream),
    save_to_file(T, FileName).

%%%%%%%%%%%%%%%%%%%%%%% CustId - CustName %%%%%%%%%%%%%%%%%%%%%%%
make_prolog_facts_CustId_to_CustName([], []).
make_prolog_facts_CustId_to_CustName([H|T], [map_customer_custid_custname(CustomerId, CustomerName) | L]):-
	H = table(_RowId, _OrderId, _OrderDate, CustomerId, CustomerName, _Segement),
	make_prolog_facts_CustId_to_CustName(T, L).

save_facts_CI_CN():-
	read_csv_file('Customer.csv', 6, Rows),
	make_prolog_facts_CustId_to_CustName(Rows, Facts),
	save_to_file(Facts, 'map_customer_custid_custname.pl').

%:- save_facts_CI_CN.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%% OrderId - CustId %%%%%%%%%%%%%%%%%%%%%%%
make_prolog_facts_OrderId_to_CustId([], []).
make_prolog_facts_OrderId_to_CustId([H|T], [map_customer_custid_orderid(CustomerId, OrderId) | L]):-
	H = table(_RowId, OrderId, _OrderDate, CustomerId, _CustomerName, _Segement),
	make_prolog_facts_OrderId_to_CustId(T, L).

save_facts_CI_OI():-
	read_csv_file('Customer.csv', 6, Rows),
	make_prolog_facts_OrderId_to_CustId(Rows, Facts),
	save_to_file(Facts, 'map_customer_custid_orderid.pl').

%:- save_facts_CI_OI.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%% OrderId - OrderDate %%%%%%%%%%%%%%%%%%%%%%%
make_prolog_facts_OrderId_to_OrderDate([], []).
make_prolog_facts_OrderId_to_OrderDate([H|T], [map_customer_orderid_orderdate(OrderId, OrderDate) | L]):-
	H = table(_RowId, OrderId, OrderDate, _CustomerId, _CustomerName, _Segement),
	make_prolog_facts_OrderId_to_OrderDate(T, L).

save_facts_OI_OD():-
	read_csv_file('Customer.csv', 6, Rows),
	make_prolog_facts_OrderId_to_OrderDate(Rows, Facts),
	save_to_file(Facts, 'map_customer_orderid_orderdate.pl').

%:- save_facts_OI_OD.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%% OrderId - Segment %%%%%%%%%%%%%%%%%%%%%%%
make_prolog_facts_OrderId_to_Segment([], []).
make_prolog_facts_OrderId_to_Segment([H|T], [map_customer_orderid_segment(OrderId, Segement) | L]):-
	H = table(_RowId, OrderId, _OrderDate, _CustomerId, _CustomerName, Segement),
	make_prolog_facts_OrderId_to_Segment(T, L).

save_facts_OI_Seg():-
	read_csv_file('Customer.csv', 6, Rows),
	make_prolog_facts_OrderId_to_Segment(Rows, Facts),
	save_to_file(Facts, 'map_customer_orderid_segment.pl').

%:- save_facts_OI_Seg.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%% Order Id - ProductName %%%%%%%%%%%%%%%%%%%%%%%

make_prolog_facts_OrderId_to_ProductName([], []).
make_prolog_facts_OrderId_to_ProductName([H|T], [map_product_orderid_productname(OrderId, ProductName) | L]):-
	H = table(_RowId, OrderId, _ProductId, _Category, _SubCategory, ProductName),
	make_prolog_facts_OrderId_to_ProductName(T, L).

save_facts_OI_PN():-
	read_csv_file('Product.csv', 6, Rows),
	make_prolog_facts_OrderId_to_ProductName(Rows, Facts),
	save_to_file(Facts, 'map_product_orderid_productname.pl').

%:- save_facts_OI_PN.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%% Order Id - ProductId %%%%%%%%%%%%%%%%%%%%%%%

make_prolog_facts_OrderId_to_ProductId([], []).
make_prolog_facts_OrderId_to_ProductId([H|T], [map_product_orderid_productid(OrderId, ProductId) | L]):-
	H = table(_RowId, OrderId, ProductId, _Category, _SubCategory, _ProductName),
	make_prolog_facts_OrderId_to_ProductId(T, L).

save_facts_OI_PI():-
	read_csv_file('Product.csv', 6, Rows),
	make_prolog_facts_OrderId_to_ProductId(Rows, Facts),
	save_to_file(Facts, 'map_product_orderid_productid.pl').

%:- save_facts_OI_PI.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%% Order Id - Category %%%%%%%%%%%%%%%%%%%%%%%

make_prolog_facts_OrderId_to_Category([], []).
make_prolog_facts_OrderId_to_Category([H|T], [map_product_orderid_category(OrderId, Category) | L]):-
	H = table(_RowId, OrderId, _ProductId, Category, _SubCategory, _ProductName),
	make_prolog_facts_OrderId_to_Category(T, L).

save_facts_OI_Cat():-
	read_csv_file('Product.csv', 6, Rows),
	make_prolog_facts_OrderId_to_Category(Rows, Facts),
	save_to_file(Facts, 'map_product_orderid_category.pl').

%:- save_facts_OI_Cat.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%% Order Id - SubCategory %%%%%%%%%%%%%%%%%%%%%%%

make_prolog_facts_OrderId_to_SubCategory([], []).
make_prolog_facts_OrderId_to_SubCategory([H|T], [map_product_orderid_subcategory(OrderId, SubCategory) | L]):-
	H = table(_RowId, OrderId, _ProductId, _Category, SubCategory, _ProductName),
	make_prolog_facts_OrderId_to_SubCategory(T, L).

save_facts_OI_SubCat():-
	read_csv_file('Product.csv', 6, Rows),
	make_prolog_facts_OrderId_to_SubCategory(Rows, Facts),
	save_to_file(Facts, 'map_product_orderid_subcategory.pl').

%:- save_facts_OI_SubCat.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%% Order Id - Sales %%%%%%%%%%%%%%%%%%%%%%%

make_prolog_facts_OrderId_to_Sales([], []).
make_prolog_facts_OrderId_to_Sales([H|T], [map_sales_orderid_sales(OrderId, Sales) | L]):-
	H = table(_RowId, OrderId, Sales, _Quantity, _Discount, _Profit),
	make_prolog_facts_OrderId_to_Sales(T, L).

save_facts_OI_Sales():-
	read_csv_file('Sales.csv', 6, Rows),
	make_prolog_facts_OrderId_to_Sales(Rows, Facts),
	save_to_file(Facts, 'map_sales_orderid_sales.pl').

%:- save_facts_OI_Sales.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%% Order Id - Quantity %%%%%%%%%%%%%%%%%%%%%%%

make_prolog_facts_OrderId_to_Quantity([], []).
make_prolog_facts_OrderId_to_Quantity([H|T], [map_sales_orderid_quantity(OrderId, Quantity) | L]):-
	H = table(_RowId, OrderId, _Sales, Quantity, _Discount, _Profit),
	make_prolog_facts_OrderId_to_Quantity(T, L).

save_facts_OI_Quantity():-
	read_csv_file('Sales.csv', 6, Rows),
	make_prolog_facts_OrderId_to_Quantity(Rows, Facts),
	save_to_file(Facts, 'map_sales_orderid_quantity.pl').

%:- save_facts_OI_Quantity.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%% Order Id - Discount %%%%%%%%%%%%%%%%%%%%%%%

make_prolog_facts_OrderId_to_Discount([], []).
make_prolog_facts_OrderId_to_Discount([H|T], [map_sales_orderid_discount(OrderId, Discount) | L]):-
	H = table(_RowId, OrderId, _Sales, _Quantity, Discount, _Profit),
	make_prolog_facts_OrderId_to_Discount(T, L).

save_facts_OI_Discount():-
	read_csv_file('Sales.csv', 6, Rows),
	make_prolog_facts_OrderId_to_Discount(Rows, Facts),
	save_to_file(Facts, 'map_sales_orderid_discount.pl').

%:- save_facts_OI_Discount.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%% Order Id - Profit %%%%%%%%%%%%%%%%%%%%%%%

make_prolog_facts_OrderId_to_Profitt([], []).
make_prolog_facts_OrderId_to_Profitt([H|T], [map_sales_orderid_profit(OrderId, Profit) | L]):-
	H = table(_RowId, OrderId, _Sales, _Quantity, _Discount, Profit),
	make_prolog_facts_OrderId_to_Profitt(T, L).

save_facts_OI_Profit():-
	read_csv_file('Sales.csv', 6, Rows),
	make_prolog_facts_OrderId_to_Profitt(Rows, Facts),
	save_to_file(Facts, 'map_sales_orderid_profit.pl').

%:- save_facts_OI_Profit.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%% Order Id - Ship Date %%%%%%%%%%%%%%%%%%%%%%%

make_prolog_facts_OrderId_to_ShipDate([], []).
make_prolog_facts_OrderId_to_ShipDate([H|T], [map_sales_orderid_shipdate(OrderId, ShipDate) | L]):-
	H = table(_RowId, OrderId, ShipDate, _ShipMode, _Country, _City, _State, _PostalCode, _Region),
	make_prolog_facts_OrderId_to_ShipDate(T, L).

save_facts_OI_ShipDate():-
	read_csv_file('Shipment.csv', 9, Rows),
	make_prolog_facts_OrderId_to_ShipDate(Rows, Facts),
	save_to_file(Facts, 'map_shipment_orderid_shipdate.pl').

%:- save_facts_OI_ShipDate.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%% Order Id - Ship Mode %%%%%%%%%%%%%%%%%%%%%%%

make_prolog_facts_OrderId_to_ShipMode([], []).
make_prolog_facts_OrderId_to_ShipMode([H|T], [map_shipment_orderid_shipmode(OrderId, ShipMode) | L]):-
	H = table(_RowId, OrderId, _ShipDate, ShipMode, _Country, _City, _State, _PostalCode, _Region),
	make_prolog_facts_OrderId_to_ShipMode(T, L).

save_facts_OI_ShipMode():-
	read_csv_file('Shipment.csv', 9, Rows),
	make_prolog_facts_OrderId_to_ShipMode(Rows, Facts),
	save_to_file(Facts, 'map_shipment_orderid_shipmode.pl').

%:- save_facts_OI_ShipMode.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%% Order Id - Country %%%%%%%%%%%%%%%%%%%%%%%

make_prolog_facts_OrderId_to_Country([], []).
make_prolog_facts_OrderId_to_Country([H|T], [map_shipment_orderid_country(OrderId, Country) | L]):-
	H = table(_RowId, OrderId, _ShipDate, _ShipMode, Country, _City, _State, _PostalCode, _Region),
	make_prolog_facts_OrderId_to_Country(T, L).

save_facts_OI_Country():-
	read_csv_file('Shipment.csv', 9, Rows),
	make_prolog_facts_OrderId_to_Country(Rows, Facts),
	save_to_file(Facts, 'map_shipment_orderid_country.pl').

%:- save_facts_OI_Country.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%% Order Id - City %%%%%%%%%%%%%%%%%%%%%%%

make_prolog_facts_OrderId_to_City([], []).
make_prolog_facts_OrderId_to_City([H|T], [map_shipment_orderid_city(OrderId, City) | L]):-
	H = table(_RowId, OrderId, _ShipDate, _ShipMode, _Country, City, _State, _PostalCode, _Region),
	make_prolog_facts_OrderId_to_City(T, L).

save_facts_OI_City():-
	read_csv_file('Shipment.csv', 9, Rows),
	make_prolog_facts_OrderId_to_City(Rows, Facts),
	save_to_file(Facts, 'map_shipment_orderid_city.pl').

%:- save_facts_OI_City.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%% Order Id - State %%%%%%%%%%%%%%%%%%%%%%%

make_prolog_facts_OrderId_to_State([], []).
make_prolog_facts_OrderId_to_State([H|T], [map_shipment_orderid_state(OrderId, State) | L]):-
	H = table(_RowId, OrderId, _ShipDate, _ShipMode, _Country, _City, State, _PostalCode, _Region),
	make_prolog_facts_OrderId_to_State(T, L).

save_facts_OI_State():-
	read_csv_file('Shipment.csv', 9, Rows),
	make_prolog_facts_OrderId_to_State(Rows, Facts),
	save_to_file(Facts, 'map_shipment_orderid_state.pl').

%:- save_facts_OI_State.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%% Order Id - Postal Code %%%%%%%%%%%%%%%%%%%%%%%

make_prolog_facts_OrderId_to_PostalCode([], []).
make_prolog_facts_OrderId_to_PostalCode([H|T], [map_shipment_orderid_postalcode(OrderId, PostalCode) | L]):-
	H = table(_RowId, OrderId, _ShipDate, _ShipMode, _Country, _City, _State, PostalCode, _Region),
	make_prolog_facts_OrderId_to_PostalCode(T, L).

save_facts_OI_PostalCode():-
	read_csv_file('Shipment.csv', 9, Rows),
	make_prolog_facts_OrderId_to_PostalCode(Rows, Facts),
	save_to_file(Facts, 'map_shipment_orderid_postalcode.pl').

%:- save_facts_OI_PostalCode.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%% Order Id - Region %%%%%%%%%%%%%%%%%%%%%%%

make_prolog_facts_OrderId_to_Region([], []).
make_prolog_facts_OrderId_to_Region([H|T], [map_shipment_orderid_region(OrderId, Region) | L]):-
	H = table(_RowId, OrderId, _ShipDate, _ShipMode, _Country, _City, _State, _PostalCode, Region),
	make_prolog_facts_OrderId_to_Region(T, L).

save_facts_OI_Region():-
	read_csv_file('Shipment.csv', 9, Rows),
	make_prolog_facts_OrderId_to_Region(Rows, Facts),
	save_to_file(Facts, 'map_shipment_orderid_region.pl').

%:- save_facts_OI_Region.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%

:- [map_customer_custid_custname].
:- [map_customer_custid_orderid].
:- [map_customer_orderid_orderdate].
:- [map_customer_orderid_segment].
:- [map_product_orderid_productname].
:- [map_product_orderid_productid].
:- [map_product_orderid_category].
:- [map_product_orderid_subcategory].
:- [map_sales_orderid_sales].
:- [map_sales_orderid_quantity].
:- [map_sales_orderid_discount].
:- [map_sales_orderid_profit].
:- [map_shipment_orderid_shipdate].
:- [map_shipment_orderid_shipmode].
:- [map_shipment_orderid_country].
:- [map_shipment_orderid_city].
:- [map_shipment_orderid_state].
:- [map_shipment_orderid_postalcode].
:- [map_shipment_orderid_region].

write_list([]).
write_list([H|T]):-
	writeln(H),
	fail;
	write_list(T),
	true.

find_customer_id_name_segment([], []).
find_customer_id_name_segment([Oid|T], [(Oid,Cid, Cname, Segment)|L]):-
	map_customer_custid_orderid(Cid, Oid),
	map_customer_custid_custname(Cid, Cname),
	map_customer_orderid_segment(Oid, Segment),
	find_customer_id_name_segment(T, L).

order_customer_info():-
	findall(Oid, map_product_orderid_category(Oid, 'Furniture'), Oids ),
	sort(Oids, UOids),
	find_customer_id_name_segment(UOids, L),
	write_list(L).


