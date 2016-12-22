select r,logic,
round((jan/total)*100,2) jan,round((feb/total)*100,2) feb,round((mar/total)*100,2) mar,round((apr/total)*100,2) apr,round((may/total)*100,2) may,round((jun/total)*100,2) jun,
round((jul/total)*100,2) jul,round((aug/total)*100,2) aug,round((sep/total)*100,2) sep,round((oct/total)*100,2) oct,round((nov/total)*100,2) nov,round((dece/total)*100,2) dece,
round((yr/total)*100,2) yr
from 
(
select count(*) total from _orgunitstructure 
where level=6
and idlevel2=68705
)sag4
inner join 
(
	select '1' r,'villages where any event reported for CM or SBCC program / total villages X100' logic,
	sum(jan) jan,sum(feb) feb,sum(mar) mar,sum(apr) apr,sum(may) may,sum(jun) jun,
	sum(jul) jul,sum(aug) aug,sum(sep) sep,sum(oct) oct,sum(nov) nov,sum(dece) dece,sum(yr) yr
	from
	(
		select 
		case when mn=1 then count end jan,
		case when mn=2 then count end feb,
		case when mn=3 then count end mar,
		case when mn=4 then count end apr,
		case when mn=5 then count end may,
		case when mn=6 then count end jun,
		case when mn=7 then count end jul,
		case when mn=8 then count end aug,
		case when mn=9 then count end sep,
		case when mn=10 then count end oct,
		case when mn=11 then count end nov,
		case when mn=12 then count end dece,
		case when ty like 'y' then count end yr

		from 
		(
			select mn, count(ou) ,'m' ty from
			(	
				select mn,ou from 
				(
				select EXTRACT(MONTH FROM  psi.executiondate) mn,EXTRACT(YEAR FROM  psi.executiondate) yr,psi.organisationunitid ou
				from trackedentitydatavalue td
				inner join dataelement de on de.dataelementid=td.dataelementid and  de.uid like 'S823xvFus7X'
				inner join programstageinstance psi on psi.programstageinstanceid=td.programstageinstanceid 
					and psi.executiondate is not null 
					and EXTRACT(YEAR FROM  psi.executiondate)=2016
				inner join programstage ps on ps.programstageid=psi.programstageid and ps.uid in ('dtw2MsTE3mY','ZYe7yHyMoam')
				inner join program p on p.programid=ps.programid and p.uid in ('NWBCZDopq29','t4ceaFBNyQJ')
				)sag
				group by mn,ou
			)sag
			group by mn
				
			union 

			select yr,count(ou), 'y' from 
			(
			select distinct psi.organisationunitid ou, EXTRACT(YEAR FROM  psi.executiondate) yr
			from trackedentitydatavalue td
			inner join dataelement de on de.dataelementid=td.dataelementid and  de.uid like 'S823xvFus7X'
			inner join programstageinstance psi on psi.programstageinstanceid=td.programstageinstanceid 
				and psi.executiondate is not null 
				and EXTRACT(YEAR FROM  psi.executiondate)=2016
			inner join programstage ps on ps.programstageid=psi.programstageid and ps.uid in ('dtw2MsTE3mY','ZYe7yHyMoam')
			inner join program p on p.programid=ps.programid and p.uid in ('NWBCZDopq29','t4ceaFBNyQJ')
			)sag
			group by yr
		)sag1
	)sag2

	union

	select '2' r, 'villages where any enrolment done to HH registration program / total villages X100',
	sum(jan) jan,sum(feb) feb,sum(mar) mar,sum(apr) apr,sum(may) may,sum(jun) jun,
	sum(jul) jul,sum(aug) aug,sum(sep) sep,sum(oct) oct,sum(nov) nov,sum(dece) dece,sum(yr) yr
	from
	(
		select 
		case when mn=1 then count end jan,
		case when mn=2 then count end feb,
		case when mn=3 then count end mar,
		case when mn=4 then count end apr,
		case when mn=5 then count end may,
		case when mn=6 then count end jun,
		case when mn=7 then count end jul,
		case when mn=8 then count end aug,
		case when mn=9 then count end sep,
		case when mn=10 then count end oct,
		case when mn=11 then count end nov,
		case when mn=12 then count end dece,
		case when ty like 'y' then count end yr

		from 
		(
			select mn, count(ou) ,'m' ty from
			(	
				select mn,ou from 
				(
				select EXTRACT(MONTH FROM  pi.enrollmentdate) mn,EXTRACT(YEAR FROM  pi.enrollmentdate) yr,pi.organisationunitid ou
				from programinstance pi
				inner join program p on p.programid=pi.programid and p.uid in ('cs9lkDp5O4m')
				where pi.enrollmentdate is not null 
				and EXTRACT(YEAR FROM  pi.enrollmentdate)=2016
				and pi.organisationunitid is not null	
				)sag
				group by mn,ou
			)sag
			group by mn
				

			union 

			select yr,count(ou), 'y' from 
			(
			select distinct pi.organisationunitid ou, EXTRACT(YEAR FROM  pi.enrollmentdate) yr
			from programinstance pi
			inner join program p on p.programid=pi.programid and p.uid in ('cs9lkDp5O4m')
			where pi.enrollmentdate is not null 
			and EXTRACT(YEAR FROM  pi.enrollmentdate)=2016
			and pi.organisationunitid is not null	
			)sag
			group by yr
		)sag1
	)sag2

	union

	select '3' r,'villages where any sales closed stage in HH registration reported/ total villages X100',
	sum(jan) jan,sum(feb) feb,sum(mar) mar,sum(apr) apr,sum(may) may,sum(jun) jun,
	sum(jul) jul,sum(aug) aug,sum(sep) sep,sum(oct) oct,sum(nov) nov,sum(dece) dece,sum(yr) yr
	from
	(
		select 
		case when mn=1 then count end jan,
		case when mn=2 then count end feb,
		case when mn=3 then count end mar,
		case when mn=4 then count end apr,
		case when mn=5 then count end may,
		case when mn=6 then count end jun,
		case when mn=7 then count end jul,
		case when mn=8 then count end aug,
		case when mn=9 then count end sep,
		case when mn=10 then count end oct,
		case when mn=11 then count end nov,
		case when mn=12 then count end dece,
		case when ty like 'y' then count end yr

		from 
		(
			select mn, count(ou) ,'m' ty from
			(	
				select mn,ou from 
				(
				select EXTRACT(MONTH FROM  psi.executiondate) mn,EXTRACT(YEAR FROM  psi.executiondate) yr,psi.organisationunitid ou
				from trackedentitydatavalue td
				inner join dataelement de on de.dataelementid=td.dataelementid and  de.uid like 'qL7s1qZUix8'
				inner join programstageinstance psi on psi.programstageinstanceid=td.programstageinstanceid 
					and psi.executiondate is not null 
					and EXTRACT(YEAR FROM  psi.executiondate)=2016
				inner join programstage ps on ps.programstageid=psi.programstageid and ps.uid in ('CJuhZv1vbwo')
				inner join program p on p.programid=ps.programid and p.uid in ('cs9lkDp5O4m')
				)sag
				group by mn,ou
			)sag
			group by mn
				

			union 

			select yr,count(ou), 'y' from 
			(
			select distinct psi.organisationunitid ou, EXTRACT(YEAR FROM  psi.executiondate) yr
			from trackedentitydatavalue td
			inner join dataelement de on de.dataelementid=td.dataelementid and  de.uid like 'qL7s1qZUix8'
			inner join programstageinstance psi on psi.programstageinstanceid=td.programstageinstanceid 
				and psi.executiondate is not null 
				and EXTRACT(YEAR FROM  psi.executiondate)=2016
			inner join programstage ps on ps.programstageid=psi.programstageid and ps.uid in ('CJuhZv1vbwo')
			inner join program p on p.programid=ps.programid and p.uid in ('cs9lkDp5O4m')
			)sag
			group by yr
		)sag1
	)sag2

	union

	select '4' r,'villages where any enrolment done to HH registration program and origin of HH registration is HH visit, CM, or SBCC event / total villages X 100',
	sum(jan) jan,sum(feb) feb,sum(mar) mar,sum(apr) apr,sum(may) may,sum(jun) jun,
	sum(jul) jul,sum(aug) aug,sum(sep) sep,sum(oct) oct,sum(nov) nov,sum(dece) dece,sum(yr) yr
	from
	(
		select 
		case when mn=1 then count end jan,
		case when mn=2 then count end feb,
		case when mn=3 then count end mar,
		case when mn=4 then count end apr,
		case when mn=5 then count end may,
		case when mn=6 then count end jun,
		case when mn=7 then count end jul,
		case when mn=8 then count end aug,
		case when mn=9 then count end sep,
		case when mn=10 then count end oct,
		case when mn=11 then count end nov,
		case when mn=12 then count end dece,
		case when ty like 'y' then count end yr

		from 
		(
			select mn, count(ou) ,'m' ty from
			(	
				select mn,ou from 
				(
				select EXTRACT(MONTH FROM  pi.enrollmentdate) mn,EXTRACT(YEAR FROM  pi.enrollmentdate) yr,pi.organisationunitid ou
				from programinstance pi
				inner join program p on p.programid=pi.programid and p.uid in ('cs9lkDp5O4m')
				inner join trackedentityattributevalue teav on teav.trackedentityinstanceid=pi.trackedentityinstanceid and teav.value in ('Household Visit','Community Meeting','SBCC Event')
				inner join trackedentityattribute tea on tea.trackedentityattributeid=teav.trackedentityattributeid and tea.uid like 'Rz1My9nLiD0'
				where pi.enrollmentdate is not null 
				and EXTRACT(YEAR FROM  pi.enrollmentdate)=2016
				and pi.organisationunitid is not null	
				)sag
				group by mn,ou
			)sag
			group by mn
				

			union 

			select yr,count(ou), 'y' from 
			(
			select distinct pi.organisationunitid ou, EXTRACT(YEAR FROM  pi.enrollmentdate) yr
			from programinstance pi
			inner join program p on p.programid=pi.programid and p.uid in ('cs9lkDp5O4m')
			inner join trackedentityattributevalue teav on teav.trackedentityinstanceid=pi.trackedentityinstanceid and teav.value in ('Household Visit','Community Meeting','SBCC Event')
			inner join trackedentityattribute tea on tea.trackedentityattributeid=teav.trackedentityattributeid and tea.uid like 'Rz1My9nLiD0'
			where pi.enrollmentdate is not null 
			and EXTRACT(YEAR FROM  pi.enrollmentdate)=2016
			and pi.organisationunitid is not null	
			)sag
			group by yr
		)sag1
	)sag2

	union

	select '5' r,'villages where any sales closed stage in HH registration reported and origin of HH registration is HH visit, CM, or SBCC event / total villages X 100',
	sum(jan) jan,sum(feb) feb,sum(mar) mar,sum(apr) apr,sum(may) may,sum(jun) jun,
	sum(jul) jul,sum(aug) aug,sum(sep) sep,sum(oct) oct,sum(nov) nov,sum(dece) dece,sum(yr) yr
	from
	(
		select 
		case when mn=1 then count end jan,
		case when mn=2 then count end feb,
		case when mn=3 then count end mar,
		case when mn=4 then count end apr,
		case when mn=5 then count end may,
		case when mn=6 then count end jun,
		case when mn=7 then count end jul,
		case when mn=8 then count end aug,
		case when mn=9 then count end sep,
		case when mn=10 then count end oct,
		case when mn=11 then count end nov,
		case when mn=12 then count end dece,
		case when ty like 'y' then count end yr

		from 
		(
			select mn, count(ou) ,'m' ty from
			(	
				select mn,ou from 
				(
				select EXTRACT(MONTH FROM  psi.executiondate) mn,EXTRACT(YEAR FROM  psi.executiondate) yr,psi.organisationunitid ou
				from trackedentitydatavalue td
				inner join dataelement de on de.dataelementid=td.dataelementid and  de.uid like 'qL7s1qZUix8'
				inner join programstageinstance psi on psi.programstageinstanceid=td.programstageinstanceid 
					and psi.executiondate is not null 
					and EXTRACT(YEAR FROM  psi.executiondate)=2016
				inner join programstage ps on ps.programstageid=psi.programstageid and ps.uid in ('CJuhZv1vbwo')
				inner join program p on p.programid=ps.programid and p.uid in ('cs9lkDp5O4m')
				inner join programinstance pi on pi.programinstanceid=psi.programinstanceid
				inner join trackedentityattributevalue teav on teav.trackedentityinstanceid=pi.trackedentityinstanceid and teav.value in ('Household Visit','Community Meeting','SBCC Event')
				inner join trackedentityattribute tea on tea.trackedentityattributeid=teav.trackedentityattributeid and tea.uid like 'Rz1My9nLiD0'
				)sag
				group by mn,ou
			)sag
			group by mn
				

			union 

			select yr,count(ou), 'y' from 
			(
			select distinct psi.organisationunitid ou, EXTRACT(YEAR FROM  psi.executiondate) yr
			from trackedentitydatavalue td
			inner join dataelement de on de.dataelementid=td.dataelementid and  de.uid like 'qL7s1qZUix8'
			inner join programstageinstance psi on psi.programstageinstanceid=td.programstageinstanceid 
				and psi.executiondate is not null 
				and EXTRACT(YEAR FROM  psi.executiondate)=2016
			inner join programstage ps on ps.programstageid=psi.programstageid and ps.uid in ('CJuhZv1vbwo')
			inner join program p on p.programid=ps.programid and p.uid in ('cs9lkDp5O4m')
			inner join programinstance pi on pi.programinstanceid=psi.programinstanceid
			inner join trackedentityattributevalue teav on teav.trackedentityinstanceid=pi.trackedentityinstanceid and teav.value in ('Household Visit','Community Meeting','SBCC Event')
			inner join trackedentityattribute tea on tea.trackedentityattributeid=teav.trackedentityattributeid and tea.uid like 'Rz1My9nLiD0'
			)sag
			group by yr
		)sag1
	)sag2
)sag3
on 1=1
order by r