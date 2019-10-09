from pyecharts.charts import Bar
from pyecharts import options as opts
from pyecharts.charts import Map
# V1 版本开始支持链式调用
place=np.array(province)
bar = (
    Bar()
    .add_xaxis(list(place[:,0]))
    .add_yaxis("热度", list(place[:,1]))
    .set_global_opts(
            # 设置全局参数
            title_opts=opts.TitleOpts(title="国庆旅游热度"), # 设置title
            xaxis_opts= opts.AxisOpts(
                splitline_opts=opts.SplitLineOpts(is_show=True)
                ),  # 设置x轴
            yaxis_opts= opts.AxisOpts(
                splitarea_opts=opts.SplitAreaOpts(is_show=True, areastyle_opts=opts.AreaStyleOpts(opacity=1))
                ),  # 设置y轴
            toolbox_opts = opts.ToolboxOpts(is_show = True),  # 设置工具箱
            datazoom_opts= [opts.DataZoomOpts(range_start=10, range_end=80,is_zoom_lock=False)],   # 设置slider
        )
)
bar.render(path="国庆旅游热度1.html")

# 不习惯链式调用的开发者依旧可以单独调用方法
bar = Bar()
bar.add_xaxis(list(place[:,0]))
bar.add_yaxis("热度",list(place[:,1]))
bar.set_global_opts(title_opts=opts.TitleOpts(title="国庆旅游热度"))
bar.set_global_opts(xaxis_opts=opts.AxisOpts(axislabel_opts={"rotate":45}),toolbox_opts = opts.ToolboxOpts(is_show = True),datazoom_opts= [opts.DataZoomOpts(range_start=10, range_end=80,is_zoom_lock=False)])
#bar.set_global_opts(xaxis_opts=opts.AxisTickOpts(is_align_with_label=0))
#bar.set_series_opts(label_opts=opts.AxisTickOpts(font_size=5))
bar.render(path="国庆旅游热度.html")


province_distribution = {'河南': 45.23, '北京': 37.56, '河北': 21, '辽宁': 12, '江西': 6, '上海': 20, '安徽': 10, '江苏': 16, '湖南': 9,'浙江': 13, '海南': 2, '广东': 22, '湖北': 8, '黑龙江': 11, '澳门': 1, '陕西': 11, '四川': 7, '内蒙古': 3, '重庆': 3,'云南': 6, '贵州': 2, '吉林': 3, '山西': 12, '山东': 11, '福建': 4, '青海': 1, '天津': 1,'其他': 1}
provice = list(province_distribution.keys())
values = list(province_distribution.values())


def map_base(data) -> Map:
    c = (
        Map()
        .add("商家A", [list(z) for z in zip(data[:,0], data[:,0])], "china")
        .set_global_opts(
            title_opts=opts.TitleOpts(title="Map"),
            visualmap_opts=opts.VisualMapOpts(max_=200, is_piecewise=True),
        )
    )
    c.render(path="省份活跃度.html")
    return True

    
    