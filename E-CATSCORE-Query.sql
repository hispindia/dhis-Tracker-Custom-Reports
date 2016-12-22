select '0. Overall Performance' title,cat, COALESCE(sum(e1),0) e1,COALESCE(sum(e2),0) e2,COALESCE(sum(e3),0) e3,COALESCE(sum(e4),0) e4,COALESCE(sum(e5),0) e5
from
	(
	select cat,
	case when etype=1 then 1 end e1,case when etype=2 then 1 end e2,case when etype=3 then 1 end e3,
	case when etype=4 then 1 end e4,case when etype=5 then 1 end e5
	from 
		(
		select etype,ou,psi,s.cat
		from
			(
			select 'A' as cat from dataelement de where de.uid like 'kgcK2rhTLnH'
			union
			select 'B' as cat from dataelement de where de.uid like 'kgcK2rhTLnH'
			union
			select 'C' as cat from dataelement de where de.uid like 'kgcK2rhTLnH'
			)s
			left join
			(
			select 	row_number() over(PARTITION BY ou order by ou,psi) etype, ou,psi,
			case when (sum(v)/350)*100 > 75 then 'A' 
			     when (sum(v)/350)*100 <= 75 and ((sum(v)/350)*100) >= 50 then 'B' 
			     when (sum(v)/350)*100 < 50 then 'C' 
			     end cat
			from
				(
				select td.programstageinstanceid psi, td.dataelementid de, td.value::FLOAT v,psi.organisationunitid ou,os.level
				from trackedentitydatavalue td
				inner join dataelement de on de.dataelementid=td.dataelementid 
					and  de.uid in ('kgcK2rhTLnH','GrPxt1uOL9H','dqgfM8ycPvd','xRdIOjoNK8k','JivAj1HsKDm','q1vKFaXz95V','lHP8eBVd5BI','IOuW9FJn4Wj','EI4YCNjgnSN',
					'adP2D3TLJkp','oHidspARjdK','tzQIDZaOJbm','qYQom0mswYk','emGnqddoTth','grPzpAFbqoS','P6WA4MCoC1v','JPFXu1XajqL','cJhxh1Vqw9m',
					'n2GC90Ydu9G','GdrgC7NIV8F','QBF6hSOBoga','vuCnbXlITRV','T23X8ZTP9L2','oEUUzJFaAHT','XOMjIutrmeu','jIS9tgWmlfI','Z6kXy5CMcYO',
					'NxA20D7iGPj','z2kiHM6rzNf','EMbs0jRzFoN','r1u3JMco6dK','NoNiJQPtVcS','BJeewbLZDyE','YteX0YNEHTZ','Di5pDKRZaQV')
				inner join programstageinstance psi on psi.programstageinstanceid=td.programstageinstanceid 
				inner join _orgunitstructure os on os.organisationunitid=psi.organisationunitid 
					and case when 1='${oulevel}' then uidlevel1='${ouid}'
				 when 2='${oulevel}' then uidlevel2='${ouid}'
				 when 3='${oulevel}' then uidlevel3='${ouid}'
				 when 4='${oulevel}' then uidlevel4='${ouid}'
				 when 5='${oulevel}' then uidlevel5='${ouid}'
				 when 6='${oulevel}' then uidlevel6='${ouid}' end
				inner join programstage ps on ps.programstageid=psi.programstageid and ps.uid in ('Ajmd4Bzv8Ds')
				inner join program p on p.programid=ps.programid and p.uid in ('Xf5sLpgHVXE')
				)sag
			group by ou,psi	
			)s1
			on s.cat=s1.cat
		)sag1	

	)sag2
group by cat


union


select '1. Entrepreneur Background' title,cat, COALESCE(sum(e1),0) e1,COALESCE(sum(e2),0) e2,COALESCE(sum(e3),0) e3,COALESCE(sum(e4),0) e4,COALESCE(sum(e5),0) e5
from
	(
	select cat,
	case when etype=1 then 1 end e1,case when etype=2 then 1 end e2,case when etype=3 then 1 end e3,
	case when etype=4 then 1 end e4,case when etype=5 then 1 end e5
	from 
		(

		select etype,ou,psi,s.cat
		from
			(
			select 'A' as cat from dataelement de where de.uid like 'kgcK2rhTLnH'
			union
			select 'B' as cat from dataelement de where de.uid like 'kgcK2rhTLnH'
			union
			select 'C' as cat from dataelement de where de.uid like 'kgcK2rhTLnH'
			)s
			left join
			(
			select 	row_number() over(PARTITION BY ou order by ou,psi) etype, ou,psi,
			case when ((sum(v)/60)*20)> 15 then 'A' 
			     when ((sum(v)/60)*20) <= 15 and ((sum(v)/60)*20) >= 10 then 'B' 
			     when ((sum(v)/60)*20) < 10 then 'C' 
			     end cat
			from
				(
				select td.programstageinstanceid psi, td.dataelementid de, td.value::FLOAT v,psi.organisationunitid ou,os.level
				from trackedentitydatavalue td
				inner join dataelement de on de.dataelementid=td.dataelementid and  de.uid in ('grPzpAFbqoS','P6WA4MCoC1v','JPFXu1XajqL','cJhxh1Vqw9m','n2GC90Ydu9G','GdrgC7NIV8F')
				inner join programstageinstance psi on psi.programstageinstanceid=td.programstageinstanceid 
				inner join _orgunitstructure os on os.organisationunitid=psi.organisationunitid 
						and case when 1='${oulevel}' then uidlevel1='${ouid}'
				 when 2='${oulevel}' then uidlevel2='${ouid}'
				 when 3='${oulevel}' then uidlevel3='${ouid}'
				 when 4='${oulevel}' then uidlevel4='${ouid}'
				 when 5='${oulevel}' then uidlevel5='${ouid}'
				 when 6='${oulevel}' then uidlevel6='${ouid}' end
				inner join programstage ps on ps.programstageid=psi.programstageid and ps.uid in ('Ajmd4Bzv8Ds')
				inner join program p on p.programid=ps.programid and p.uid in ('Xf5sLpgHVXE')
				)sag
			group by ou,psi	
			)s1
			on s.cat=s1.cat
		)sag1	

	)sag2
group by cat


union

select '2. Professional cum Technical Skill' title,cat, COALESCE(sum(e1),0) e1,COALESCE(sum(e2),0) e2,COALESCE(sum(e3),0) e3,COALESCE(sum(e4),0) e4,COALESCE(sum(e5),0) e5
from
	(
	select cat,
	case when etype=1 then 1 end e1,case when etype=2 then 1 end e2,case when etype=3 then 1 end e3,
	case when etype=4 then 1 end e4,case when etype=5 then 1 end e5
	from 
		(
		select etype,ou,psi,s.cat
		from
			(
			select 'A' as cat from dataelement de where de.uid like 'kgcK2rhTLnH'
			union
			select 'B' as cat from dataelement de where de.uid like 'kgcK2rhTLnH'
			union
			select 'C' as cat from dataelement de where de.uid like 'kgcK2rhTLnH'
			)s
			left join
			(
			select 	row_number() over(PARTITION BY ou order by ou,psi) etype, ou,psi,
			case when ((sum(v)/80)*20)> 15 then 'A' 
			     when ((sum(v)/80)*20) <= 15 and ((sum(v)/80)*20) >= 10 then 'B' 
			     when ((sum(v)/80)*20) < 10 then 'C' 
			     end cat
			from
				(
				select td.programstageinstanceid psi, td.dataelementid de, td.value::FLOAT v,psi.organisationunitid ou,os.level
				from trackedentitydatavalue td
				inner join dataelement de on de.dataelementid=td.dataelementid and  de.uid in ('NxA20D7iGPj','z2kiHM6rzNf','EMbs0jRzFoN','r1u3JMco6dK','NoNiJQPtVcS','BJeewbLZDyE','YteX0YNEHTZ','Di5pDKRZaQV')
				inner join programstageinstance psi on psi.programstageinstanceid=td.programstageinstanceid 
				inner join _orgunitstructure os on os.organisationunitid=psi.organisationunitid 
						and case when 1='${oulevel}' then uidlevel1='${ouid}'
				 when 2='${oulevel}' then uidlevel2='${ouid}'
				 when 3='${oulevel}' then uidlevel3='${ouid}'
				 when 4='${oulevel}' then uidlevel4='${ouid}'
				 when 5='${oulevel}' then uidlevel5='${ouid}'
				 when 6='${oulevel}' then uidlevel6='${ouid}' end
				inner join programstage ps on ps.programstageid=psi.programstageid and ps.uid in ('Ajmd4Bzv8Ds')
				inner join program p on p.programid=ps.programid and p.uid in ('Xf5sLpgHVXE')
				)sag
			group by ou,psi	
			)s1
			on s.cat=s1.cat
		)sag1	
	)sag2
group by cat
union

select '3. Documentation Requirement' title,cat, COALESCE(sum(e1),0) e1,COALESCE(sum(e2),0) e2,COALESCE(sum(e3),0) e3,COALESCE(sum(e4),0) e4,COALESCE(sum(e5),0) e5
from
	(
	select cat,
	case when etype=1 then 1 end e1,case when etype=2 then 1 end e2,case when etype=3 then 1 end e3,
	case when etype=4 then 1 end e4,case when etype=5 then 1 end e5
	from 
		(
		select etype,ou,psi,s.cat
		from
			(
			select 'A' as cat from dataelement de where de.uid like 'kgcK2rhTLnH'
			union
			select 'B' as cat from dataelement de where de.uid like 'kgcK2rhTLnH'
			union
			select 'C' as cat from dataelement de where de.uid like 'kgcK2rhTLnH'
			)s
			left join
			(
			select 	row_number() over(PARTITION BY ou order by ou,psi) etype, ou,psi,
			case when ((sum(v)/50)*15)> 11.25 then 'A' 
			     when ((sum(v)/50)*15) <= 11.25 and ((sum(v)/50)*15) >= 7.5 then 'B' 
			     when ((sum(v)/50)*15) < 7.5 then 'C' 
			     end cat
			from
				(
				select td.programstageinstanceid psi, td.dataelementid de, td.value::FLOAT v,psi.organisationunitid ou,os.level
				from trackedentitydatavalue td
				inner join dataelement de on de.dataelementid=td.dataelementid and  de.uid in ('adP2D3TLJkp','oHidspARjdK','tzQIDZaOJbm','qYQom0mswYk','emGnqddoTth')
				inner join programstageinstance psi on psi.programstageinstanceid=td.programstageinstanceid 
				inner join _orgunitstructure os on os.organisationunitid=psi.organisationunitid 
						and case when 1='${oulevel}' then uidlevel1='${ouid}'
				 when 2='${oulevel}' then uidlevel2='${ouid}'
				 when 3='${oulevel}' then uidlevel3='${ouid}'
				 when 4='${oulevel}' then uidlevel4='${ouid}'
				 when 5='${oulevel}' then uidlevel5='${ouid}'
				 when 6='${oulevel}' then uidlevel6='${ouid}' end
				inner join programstage ps on ps.programstageid=psi.programstageid and ps.uid in ('Ajmd4Bzv8Ds')
				inner join program p on p.programid=ps.programid and p.uid in ('Xf5sLpgHVXE')
				)sag
			group by ou,psi	
			)s1
			on s.cat=s1.cat
		)sag1	

	)sag2
group by cat

union

select '4. Market Linkages' title,cat, COALESCE(sum(e1),0) e1,COALESCE(sum(e2),0) e2,COALESCE(sum(e3),0) e3,COALESCE(sum(e4),0) e4,COALESCE(sum(e5),0) e5
from
	(
	select cat,
	case when etype=1 then 1 end e1,case when etype=2 then 1 end e2,case when etype=3 then 1 end e3,
	case when etype=4 then 1 end e4,case when etype=5 then 1 end e5
	from 
		(
		select etype,ou,psi,s.cat
		from
			(
			select 'A' as cat from dataelement de where de.uid like 'kgcK2rhTLnH'
			union
			select 'B' as cat from dataelement de where de.uid like 'kgcK2rhTLnH'
			union
			select 'C' as cat from dataelement de where de.uid like 'kgcK2rhTLnH'
			)s
			left join
			(
			select 	row_number() over(PARTITION BY ou order by ou,psi) etype, ou,psi,
			case when ((sum(v)/70)*15)> 11.25 then 'A' 
			     when ((sum(v)/70)*15) <= 11.25 and ((sum(v)/70)*15) >= 7.5 then 'B' 
			     when ((sum(v)/70)*15) < 7.5 then 'C' 
			     end cat
			from
				(
				select td.programstageinstanceid psi, td.dataelementid de, td.value::FLOAT v,psi.organisationunitid ou,os.level
				from trackedentitydatavalue td
				inner join dataelement de on de.dataelementid=td.dataelementid and  de.uid in ('QBF6hSOBoga','vuCnbXlITRV','T23X8ZTP9L2','oEUUzJFaAHT','XOMjIutrmeu','jIS9tgWmlfI','Z6kXy5CMcYO')
				inner join programstageinstance psi on psi.programstageinstanceid=td.programstageinstanceid 
				inner join _orgunitstructure os on os.organisationunitid=psi.organisationunitid 
					and case when 1='${oulevel}' then uidlevel1='${ouid}'
				 when 2='${oulevel}' then uidlevel2='${ouid}'
				 when 3='${oulevel}' then uidlevel3='${ouid}'
				 when 4='${oulevel}' then uidlevel4='${ouid}'
				 when 5='${oulevel}' then uidlevel5='${ouid}'
				 when 6='${oulevel}' then uidlevel6='${ouid}' end
				inner join programstage ps on ps.programstageid=psi.programstageid and ps.uid in ('Ajmd4Bzv8Ds')
				inner join program p on p.programid=ps.programid and p.uid in ('Xf5sLpgHVXE')
				)sag
			group by ou,psi	
			)s1
			on s.cat=s1.cat
		)sag1	

	)sag2
group by cat

union

select '5. Business Performance' title,cat, COALESCE(sum(e1),0) e1,COALESCE(sum(e2),0) e2,COALESCE(sum(e3),0) e3,COALESCE(sum(e4),0) e4,COALESCE(sum(e5),0) e5
from
	(
	select cat,
	case when etype=1 then 1 end e1,case when etype=2 then 1 end e2,case when etype=3 then 1 end e3,
	case when etype=4 then 1 end e4,case when etype=5 then 1 end e5
	from 
		(
		select etype,ou,psi,s.cat
		from
			(
			select 'A' as cat from dataelement de where de.uid like 'kgcK2rhTLnH'
			union
			select 'B' as cat from dataelement de where de.uid like 'kgcK2rhTLnH'
			union
			select 'C' as cat from dataelement de where de.uid like 'kgcK2rhTLnH'
			)s
			left join
			(
			select 	row_number() over(PARTITION BY ou order by ou,psi) etype, ou,psi,
			case when ((sum(v)/90)*30)> 22.5 then 'A' 
			     when ((sum(v)/90)*30) <= 22.5 and ((sum(v)/90)*30) >= 15 then 'B' 
			     when ((sum(v)/90)*30) < 15 then 'C' 
			     end cat
			from
				(
				select td.programstageinstanceid psi, td.dataelementid de, td.value::FLOAT v,psi.organisationunitid ou,os.level
				from trackedentitydatavalue td
				inner join dataelement de on de.dataelementid=td.dataelementid and  de.uid in ('kgcK2rhTLnH','GrPxt1uOL9H','dqgfM8ycPvd','xRdIOjoNK8k','JivAj1HsKDm','q1vKFaXz95V','lHP8eBVd5BI','IOuW9FJn4Wj','EI4YCNjgnSN')
				inner join programstageinstance psi on psi.programstageinstanceid=td.programstageinstanceid 
				inner join _orgunitstructure os on os.organisationunitid=psi.organisationunitid 
				and case when 1='${oulevel}' then uidlevel1='${ouid}'
				 when 2='${oulevel}' then uidlevel2='${ouid}'
				 when 3='${oulevel}' then uidlevel3='${ouid}'
				 when 4='${oulevel}' then uidlevel4='${ouid}'
				 when 5='${oulevel}' then uidlevel5='${ouid}'
				 when 6='${oulevel}' then uidlevel6='${ouid}' end
				inner join programstage ps on ps.programstageid=psi.programstageid and ps.uid in ('Ajmd4Bzv8Ds')
				inner join program p on p.programid=ps.programid and p.uid in ('Xf5sLpgHVXE')
				)sag
			group by ou,psi	
			)s1
			on s.cat=s1.cat
		)sag1	

	)sag2
group by cat
order by title,cat;

