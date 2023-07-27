using FinalProjectCode.Models;

namespace FinalProjectCode.Interfaces
{
    public interface ILayoutService
    {
        Task<List<Setting>> GetSetting();
        //Task<List<BasketVM>> GetBasket();
    }
}
