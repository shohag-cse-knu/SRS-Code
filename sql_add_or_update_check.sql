AND (
     (DATE_FORMAT(e_dt,'%Y-%m-%d') <= '2017-12-31' OR DATE_FORMAT(e_dt,'%Y-%m-%d') = '0000-00-00')
     AND (DATE_FORMAT(u_dt,'%Y-%m-%d') = '0000-00-00' OR DATE_FORMAT(u_dt,'%Y-%m-%d') <= '2017-12-31')
)