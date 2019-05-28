/**
 *AjaxTabService
 *首页2.0 右侧单程/往返特惠 AjaxTab
 *
*/


online.create('service.index.AjaxTabService', {
	methods: {
		initialize : function (options) {
			this.info();
			this.MaxTryTimes = 0;//默认为0, 失败后不重试
			this.IntervalTime = 3000;
			this.extend(this, options);
			this.bindEvent();
			this.init();
		},
		bindEvent : function(){
			var _this = this;
			this.tmpl = this.box.find([_this.content, 'first'].join(':'));

			this.box.find(this.item).bind('click', function(e){
				e.preventDefault();
				_this.show($(this));
			});

			this.box.find('.airline_busy a').bind('click', function(e){
				e.preventDefault();
				_this.init();//重试
			});
		},
		init : function(){
			var current = this.box.find([this.item, this.style].join('.'));
			if(current.length === 0){//如果没有选中的,则默认为第一个
				current = this.box.find([this.item, 'first'].join(':'));
			}

			if(current.length > 0){//触发事件,加载内容
				this.show(current);
			}
		},
		show : function(o){
			this.box.find([this.item, this.style].join('.')).removeClass(this.style);
			o.addClass(this.style);

			var name = this.getName(o),
				target = $([this.content, name].join('.'));

			if(target.length === 0){//界面上没有,或者没有加载完成
				target = this.tmpl.clone(true).appendTo(this.box);
				target.addClass(name);
				target.attr('url', this.getUrl(o));
				this.loadData(target);
			}

			this.box.find(this.content).css('display', 'none');//隐藏所有的
			target.css('display', '');//显示当前的
		},
		loadData:function(target){
			var _this = this,
				url = target.attr('url');

			$.ajax(url, {
				onsuccess: function(xhr, data){
					_this.ajaxCallBack(target, data);
				},
				onerror: function(){
					_this.ajaxCallBack(target);
				}
			});
		},
		checkTryLimit:function(target){
			var times = target.attr('times') || 0;
			if(times >= this.MaxTryTimes){
				target.removeAttr('times');
				return false;
			}
			target.attr('times', ++times);
			var _this = this;

			setTimeout(function(){
				_this.loadData(target);
			}, this.IntervalTime);

			return true;
		}
	}
});