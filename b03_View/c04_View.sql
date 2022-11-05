create view VW_SEHIRLERE_GORE_GUNLUK_TOPLAM_SATIS_TUTARI
as
select sehir, gun, sum(satirtoplami) as toplamtutar 
FROM VW_SIPARIS_DETAYI
group by sehir, gun 

select * from VW_SEHIRLERE_GORE_GUNLUK_TOPLAM_SATIS_TUTARI