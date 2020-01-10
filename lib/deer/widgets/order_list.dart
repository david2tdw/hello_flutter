import 'package:flutter/material.dart';
import 'package:hello_flutter/deer/provider/order/order_page_provider.dart';
import 'package:hello_flutter/deer/widgets/more_widget.dart';
import 'package:hello_flutter/deer/widgets/order_item.dart';
import 'package:hello_flutter/deer/widgets/order_item_tag.dart';
import 'package:hello_flutter/deer/widgets/state_layout.dart';
import 'package:provider/provider.dart';

class OrderList extends StatefulWidget {
  final int index;

  const OrderList({
    Key key,
    @required this.index,
  }): super(key: key);

  @override
  _OrderListState createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> with AutomaticKeepAliveClientMixin<OrderList> {

  bool _isLoading = false;
  int _page = 1;
  final int _maxPage = 3;
  StateType _stateType = StateType.loading;
  int _index = 0;
  ScrollController _scrollController = ScrollController();


  @override
  void initState() {
    super.initState();
    _index = widget.index;
    _onRefresh();
  }

  @override
  bool get wantKeepAlive => null;


  @override
  Widget build(BuildContext context) {
    super.build(context); // 调用 AutomaticKeepAliveClientMixin的build
    return NotificationListener(
      onNotification: (ScrollNotification note) {
        if (note.metrics.pixels == note.metrics.maxScrollExtent) {
          _loadMore();
        }
        return true;
      },
      child: RefreshIndicator(
        onRefresh: _onRefresh,
        displacement: 120.0, // 默认40， 多添加的80为Header高度
        child: Consumer<OrderPageProvider>(
          builder: (_, provider, child) { // provider为OrderPageProvider的引用
            return CustomScrollView(
              /// 这里指定controller可以与外层NestedScrollView的滚动分离，避免一处滑动，5个Tab中的列表同步滑动。
              /// 这种方法的缺点是会重新layout列表
              controller: _index != provider.index ? _scrollController : null,
              key: PageStorageKey<String>('$_index'),
              slivers: <Widget>[
                SliverOverlapInjector(
                  //SliverAppBar的expandedHeight高度,避免重叠
                  handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                ),
                child,
              ],
            );
          },
          child: SliverPadding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            sliver: _list.isEmpty ? SliverFillRemaining(
              child: StateLayout(type: _stateType,),
            ) : SliverList(
              delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                return index < _list.length ? (index % 5 == 0 ? OrderItemTag(date: '2019年2月5日', orderTotal: 4): 
                OrderItem(
                  key: Key('order_item_$index'),
                  index: index,
                  tabIndex: _index,
                )): MoreWidget(
                  _list.length, 
                  _hasMore(),
                  10
                );
              }),
            ),
          ),
        ),
      ),
    );
  }

  List _list = [];
  Future _onRefresh() async {
    await Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _page = 1;
        _list = List.generate(10, (i) => 'newItem: $i');
      });
    });
  }

  bool _hasMore() {
    return _page < _maxPage;
  }
  
  Future _loadMore() async {
    if (_isLoading) {
      return;
    }

    if (!_hasMore()) {
      return;
    }
    _isLoading = true;
    await Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _list.addAll(List.generate(10, (i) => 'newItem: $i'));
        _page ++;
        _isLoading = false;
      });
    });
  }
}