using FinalProjectCode.Models;
using FinalProjectCode.ViewModels.BasketVMs;

namespace FinalProjectCode.Interfaces
{
    public interface ILayoutService
    {
        Task<List<Setting>> GetSetting();
        Task<List<BasketVM>> GetBasket();
    }
}
