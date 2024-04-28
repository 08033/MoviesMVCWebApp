Server=.\\SqlExpress; Database=Movies; User Id=sa; Password=Abc123;

**Step1:**
PM console:
install-package Microsoft.EntityFrameworkCore.SqlServer -Version 6.0.18
install-package Microsoft.EntityFrameworkCore.Tools -Version 6.0.18
install-package Microsoft.EntityFrameworkCore.Design -Version 6.0.18

Scaffold-DbContext "Name=ConnectionStrings:MovieConn" Microsoft.EntityFrameworkCore.SqlServer -ContextDir Database -OutputDir Models

------------------------------------------------------------------
**Step2:**

Program.cs add dbcontext

builder.Services.AddDbContext<MoviesContext>(options =>
options.UseSqlServer(builder.Configuration.GetConnectionString("MovieConn")));

------------------------------------------------------------------
**Step3:**

-declare DBContext in controller
-add DbContext in controller constructor 

------------------------------------------------------------------

1->Validations
2->Create, Update, Delete, List, View
------------------------------------------------------------------
