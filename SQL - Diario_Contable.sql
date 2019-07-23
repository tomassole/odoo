-- Consulta SQL que permite obtener un diario contable anual de la empresa --
select t2.date, t2.name, t3.code, t3.name, t4.name, debit, credit, t2.ref
	from account_move_line t1,
		account_move t2,
		account_account t3,
		res_partner t4
	where
		(t3.id = t1.account_id and
		t2.id = t1.move_id and
		t4.id = t1.partner_id) and
		t2.company_id = 4 and -- empresa PR(1), CS(4)
		t2.date >= '2018-01-01'and t2.date <= '2018-12-31' -- definir periodo 
	order by t2.date, t3.code, t4.name
