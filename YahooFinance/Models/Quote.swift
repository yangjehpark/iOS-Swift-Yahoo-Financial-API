//
//  Quote.swift
//  Stocker
//
//  Created by yangjehpark on 2017. 1. 11..
//  Copyright © 2017년 yangjehpark. All rights reserved.
//

import Foundation
import ObjectMapper

class Quote: Mappable {
    
    required init?(_ map: Map){
        
    }
    
    init() {
        
    }
    
    var symbol: String?
    var ask: String?
    var averageDailyVolume: String?
    var bid: String?
    var askRealtime: String?
    var bidRealtime: String?
    var bookValue: String?
    var changePercentChange: String?
    var change: String?
    var commission: String?
    var changeRealtime: String?
    var afterHoursChangeRealtime: String?
    var dividendShare: String?
    var castTradeDate: String?
    var tradeDate: String?
    var earningsShare: String?
    var errorIndicationreturnedforsymbolchangedinvalid: String?
    var ePSEstimateCurrentYear: String?
    var ePSEstimateNextYear: String?
    var ePSEstimateNextQuarter: String?
    var daysLow: String?
    var daysHigh: String?
    var yearLow: String?
    var yearHigh: String?
    var holdingsGainPercent: String?
    var annualizedGain: String?
    var holdingsGain: String?
    var holdingsGainPercentRealtime: String?
    var holdingsGainRealtime: String?
    var moreInfo: String?
    var orderBookRealtime: String?
    var marketCapitalization: String?
    var marketCapRealtime: String?
    var eBITDA: String?
    var changeFromYearLow: String?
    var percentChangeFromYearLow: String?
    var lastTradeRealtimeWithTime: String?
    var changePercentRealtime: String?
    var changeFromYearHigh: String?
    var percentChangeFromYearHigh: String?
    var lastTradeWithTime: String?
    var lastTradePriceOnly: String?
    var highLimit: String?
    var lowLimit: String?
    var daysRange: String?
    var daysRangeRealtime: String?
    var fiftydayMovingAverage: String?
    var twoHundreddayMovingAverage: String?
    var changeFromTwoHundreddayMovingAverage: String?
    var percentChangeFromTwoHundreddayMovingAverage: String?
    var changeFromFiftydayMovingAverage: String?
    var percentChangeFromFiftydayMovingAverage: String?
    var name: String?
    var notes: String?
    var open: String?
    var previousClose: String?
    var pricePaid: String?
    var changeinPercent: String?
    var priceSales: String?
    var priceBook: String?
    var exDividendDate: String?
    var pERatio: String?
    var dividendPayDate: String?
    var pERatioRealtime: String?
    var pEGRatio: String?
    var priceEPSEstimateCurrentYear: String?
    var priceEPSEstimateNextYear: String?
    var sharesOwned: String?
    var shortRatio: String?
    var lastTradeTime: String?
    var tickerTrend: String?
    var oneyrTargetPrice: String?
    var volume: String?
    var holdingsValue: String?
    var holdingsValueRealtime: String?
    var yearRange: String?
    var daysValueChange: String?
    var daysValueChangeRealtime: String?
    var stockExchange: String?
    var dividendYield: String?
    var percentChange: String?
    var currency: String?
    
    func mapping(map: Map) {
        self.symbol <- map["Symbol"]
        self.ask <- map["Ask"]
        self.averageDailyVolume <- map["AverageDailyVolume"]
        self.bid <- map["Bid"]
        self.askRealtime <- map["AskRealtime"]
        self.bidRealtime <- map["BidRealtime"]
        self.bookValue <- map["BookValue"]
        self.changePercentChange <- map["ChangePercentChange"]
        self.change <- map["Change"]
        self.commission <- map["Commission"]
        self.changeRealtime <- map["ChangeRealtime"]
        self.afterHoursChangeRealtime <- map["AfterHoursChangeRealtime"]
        self.dividendShare <- map["DividendShare"]
        self.castTradeDate <- map["CastTradeDate"]
        self.tradeDate <- map["TradeDate"]
        self.earningsShare <- map["EarningsShare"]
        self.errorIndicationreturnedforsymbolchangedinvalid <- map["errorIndicationreturnedforsymbolchangedinvalid"]
        self.ePSEstimateCurrentYear <- map["EPSEstimateCurrentYear"]
        self.ePSEstimateNextYear <- map["EPSEstimateNextYear"]
        self.ePSEstimateNextQuarter <- map["EPSEstimateNextQuarter"]
        self.daysLow <- map["DaysLow"]
        self.daysHigh <- map["DaysHigh"]
        self.yearLow <- map["YearLow"]
        self.yearHigh <- map["YearHigh"]
        self.holdingsGainPercent <- map["HoldingsGainPercent"]
        self.annualizedGain <- map["AnnualizedGain"]
        self.holdingsGain <- map["HoldingsGain"]
        self.holdingsGainPercentRealtime <- map["HoldingsGainPercentRealtime"]
        self.holdingsGainRealtime <- map["HoldingsGainRealtime"]
        self.moreInfo <- map["MoreInfo"]
        self.orderBookRealtime <- map["OrderBookRealtime"]
        self.marketCapitalization <- map["MarketCapitalization"]
        self.marketCapRealtime <- map["MarketCapRealtime"]
        self.eBITDA <- map["EBITDA"]
        self.changeFromYearLow <- map["ChangeFromYearLow"]
        self.percentChangeFromYearLow <- map["PercentChangeFromYearLow"]
        self.lastTradeRealtimeWithTime <- map["LastTradeRealtimeWithTime"]
        self.changePercentRealtime <- map["ChangePercentRealtime"]
        self.changeFromYearHigh <- map["ChangeFromYearHigh"]
        self.percentChangeFromYearHigh <- map["PercentChangeFromYearHigh"]
        self.lastTradeWithTime <- map["LastTradeWithTime"]
        self.lastTradePriceOnly <- map["LastTradePriceOnly"]
        self.highLimit <- map["HighLimit"]
        self.lowLimit <- map["LowLimit"]
        self.daysRange <- map["DaysRange"]
        self.daysRangeRealtime <- map["DaysRangeRealtime"]
        self.fiftydayMovingAverage <- map["FiftydayMovingAverage"]
        self.twoHundreddayMovingAverage <- map["TwoHundreddayMovingAverage"]
        self.changeFromTwoHundreddayMovingAverage <- map["ChangeFromTwoHundreddayMovingAverage"]
        self.percentChangeFromTwoHundreddayMovingAverage <- map["PercentChangeFromTwoHundreddayMovingAverage"]
        self.changeFromFiftydayMovingAverage <- map["ChangeFromFiftydayMovingAverage"]
        self.percentChangeFromFiftydayMovingAverage <- map["PercentChangeFromFiftydayMovingAverage"]
        self.name <- map["Name"]
        self.notes <- map["Notes"]
        self.open <- map["Open"]
        self.previousClose <- map["PreviousClose"]
        self.pricePaid <- map["PricePaid"]
        self.changeinPercent <- map["ChangeinPercent"]
        self.priceSales <- map["PriceSales"]
        self.priceBook <- map["PriceBook"]
        self.exDividendDate <- map["ExDividendDate"]
        self.pERatio <- map["PERatio"]
        self.dividendPayDate <- map["DividendPayDate"]
        self.pERatioRealtime <- map["PERatioRealtime"]
        self.pEGRatio <- map["PEGRatio"]
        self.priceEPSEstimateCurrentYear <- map["PriceEPSEstimateCurrentYear"]
        self.priceEPSEstimateNextYear <- map["PriceEPSEstimateNextYear"]
        self.sharesOwned <- map["SharesOwned"]
        self.shortRatio <- map["ShortRatio"]
        self.lastTradeTime <- map["LastTradeTime"]
        self.tickerTrend <- map["TickerTrend"]
        self.oneyrTargetPrice <- map["OneyrTargetPrice"]
        self.volume <- map["Volume"]
        self.holdingsValue <- map["HoldingsValue"]
        self.holdingsValueRealtime <- map["HoldingsValueRealtime"]
        self.yearRange <- map["YearRange"]
        self.daysValueChange <- map["DaysValueChange"]
        self.daysValueChangeRealtime <- map["DaysValueChangeRealtime"]
        self.stockExchange <- map["StockExchange"]
        self.dividendYield <- map["DividendYield"]
        self.percentChange <- map["PercentChange"]
        self.currency <- map["Currency"]
    }
}