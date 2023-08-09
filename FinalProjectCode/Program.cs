using FinalProjectCode.DataAccessLayer;
using FinalProjectCode.Helpers;
using FinalProjectCode.Interfaces;
using FinalProjectCode.Models;
using FinalProjectCode.Services;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using System;

var builder = WebApplication.CreateBuilder(args);
builder.Services.AddControllersWithViews();
builder.Services.AddDbContext<AppDbContext>(options =>
options.UseSqlServer(builder.Configuration.GetConnectionString("Default")));
builder.Services.AddIdentity<AppUser,IdentityRole>().AddEntityFrameworkStores<AppDbContext>().AddDefaultTokenProviders();

builder.Services.Configure<IdentityOptions>(opt =>
{
    opt.Password.RequiredLength = 8;
    opt.Password.RequireDigit = true;
    opt.Password.RequireLowercase= true;
    opt.Password.RequireUppercase= true;
    opt.Password.RequireNonAlphanumeric = true;

    opt.User.RequireUniqueEmail= true;
    opt.SignIn.RequireConfirmedEmail= true;

    opt.Lockout.MaxFailedAccessAttempts= 3;
    opt.Lockout.DefaultLockoutTimeSpan= TimeSpan.FromMinutes(30);
    opt.Lockout.AllowedForNewUsers= true;
}) ;
builder.Services.Configure<EmailSettings>(builder.Configuration.GetSection("EmailSettings"));


builder.Services.AddSession(options =>
{
    options.IdleTimeout = TimeSpan.FromSeconds(10);
});

builder.Services.AddHttpContextAccessor();

builder.Services.AddScoped<IProductService, ProductService>();
builder.Services.AddScoped<ILayoutService, LayoutService>();
builder.Services.AddScoped<IEmailService, EmailService>();
builder.Services.AddScoped<EmailSettings>();

var app = builder.Build();
app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseSession();

app.UseRouting();
app.UseAuthentication();
app.UseAuthorization();

app.MapControllerRoute(name: "areas",
            pattern: "{area:exists}/{controller=Dashboard}/{action=Index}/{id?}");

app.MapControllerRoute("default", "{controller=Home}/{action=Index}/{id?}");

app.UseStaticFiles();
app.UseSession();

app.Run();