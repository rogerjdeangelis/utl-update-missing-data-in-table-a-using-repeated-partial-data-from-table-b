Update missing data in table a using repeated partial data from table b

* This is useful and often happens;

see github
https://tinyurl.com/y7zsz9qh
https://github.com/rogerjdeangelis/utl-update-missing-data-in-table-a-using-repeated-partial-data-from-table-b

Astounding Profile
https://communities.sas.com/t5/user/viewprofilepage/user-id/4954

SAS Forum
https://tinyurl.com/ycnoogj5
https://communities.sas.com/t5/SAS-Procedures/Combining-multiple-values-on-2-data-sets/m-p/500614


INPUT
====

 WORK.HAV1ST total obs=3

   NAME     VAR1    VAR2    VAR3

   Frank    Var1    Var2    Var3
   Joe      Var1    Var2    Var3
   John     Var1    Var2    Var3


 * This is not that uncommon when transposing data;
 WORK.HAV2ND total obs=7

   NAME     VAR4    VAR5    VAR6

   Frank    Var4    Var5
   Frank                    Var6
   Joe      Var4
   Joe              Var5    Var6
   John     Var4
   John             Var5
   John                     Var6


EXAMPLE OUTPUT
--------------

 WORK.WANT total obs=3

   NAME     VAR1    VAR2    VAR3    VAR4    VAR5    VAR6

   Frank    Var1    Var2    Var3    Var4    Var5    Var6
   Joe      Var1    Var2    Var3    Var4    Var5    Var6
   John     Var1    Var2    Var3    Var4    Var5    Var6


PROCESS
=======

data want;
  update hav1st hav2nd;
  by name;
run;


OUTPUT
======

see above

*                _              _       _
 _ __ ___   __ _| | _____    __| | __ _| |_ __ _
| '_ ` _ \ / _` | |/ / _ \  / _` |/ _` | __/ _` |
| | | | | | (_| |   <  __/ | (_| | (_| | || (_| |
|_| |_| |_|\__,_|_|\_\___|  \__,_|\__,_|\__\__,_|

;

data hav1st;
 input name$ Var1$ Var2$ Var3$;
cards4;
Frank Var1 Var2 Var3
Joe Var1 Var2 Var3
John Var1 Var2 Var3
;;;;
run;quit;

data hav2nd;
 input name$ Var4$ Var5$ Var6$;
cards4;
Frank Var4 Var5 .
Frank . . Var6
Joe Var4 . .
Joe . Var5 Var6
John Var4 . .
John . Var5 .
John . . Var6
;;;;
run;quit;

