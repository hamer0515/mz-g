/* sku.list */
select t1.id as 'g.id', t1.cate_code as 'g.cate_code', t1.gname as 'g.gname'
     , t.id as 'sc.id', t.sid as 'sc.sid', t.model as 'sc.model', t.img as 'sc.img', t.pprice as 'sc.pprice'
     , t.utime as 'sc.utime', t.ctime as 'sc.ctime', t.state as 'sc.state'
     , sum(t2.count) as 'sc.count'
from t_sku t
inner join t_goods t1 on t1.id = t.goods_id
inner join t_sku_more t2 on t2.sku_id = t.id
where t.state != @t_state and t1.state = @t1_state
and t1.cate_code like @cate_code
and (t.sid like @qcond or t1.gname like @qcond)
group by t.id
ORDER BY t.utime DESC, t.ctime DESC


/* sku.countByGoodsId_STATE_NOT_RM */
select sum(t.count) from t_sku_more t
inner join t_sku t1 on t1.id = t.sku_id
inner join t_goods t2 on t2.id = t1.goods_id
where t1.state!=@t1_state and t2.id=@t2_id

