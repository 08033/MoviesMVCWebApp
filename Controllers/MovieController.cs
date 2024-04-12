using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MoviesWebApp.Database;
using MoviesWebApp.Models;

namespace MoviesWebApp.Controllers
{
    public class MovieController : Controller
    {
        private MoviesContext _dbContext;
        public MovieController(MoviesContext dbContext) {
            _dbContext = dbContext;
        }

        public IActionResult Index()
        {
            //var list = _dbContext.Films.ToList();
            var list = _dbContext.Films.FromSqlRaw("exec sp_GetFilms");            
            return View(list);
        }

        public IActionResult Create()
        {            
            return View();
        }

        [HttpPost]
        public IActionResult Create([FromBody] Film film)
        {
            try
            {
                _dbContext.Films.Add(film);
                int rows = _dbContext.SaveChanges();
                return Ok(rows);
            }
            catch(Exception ex)
            {
                Console.WriteLine(ex.Message);
                return BadRequest();
            }
        }
    }
}
