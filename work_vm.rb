class VendingMachine
  # ステップ０　お金の投入と払い戻しの例コード
  # ステップ１　扱えないお金の例コード

  # 10円玉、50円玉、100円玉、500円玉、1000円札を１つずつ投入できる。
  MONEY = [10, 50, 100, 500, 1000].freeze

  # （自動販売機に投入された金額をインスタンス変数の @slot_money に代入する）
  def initialize
    # 最初の自動販売機に入っている金額は0円
    @slot_money = 0
  end

  # 投入金額の総計を取得できる。
  def current_slot_money
    # 自動販売機に入っているお金を表示する
    @slot_money
  end

  # 10円玉、50円玉、100円玉、500円玉、1000円札を１つずつ投入できる。
  # 投入は複数回できる。
  def slot_money(money)
    # 想定外のもの（１円玉や５円玉。千円札以外のお札、そもそもお金じゃないもの（数字以外のもの）など）
    # が投入された場合は、投入金額に加算せず、それをそのまま釣り銭としてユーザに出力する。
    return false unless MONEY.include?(money)
    # 自動販売機にお金を入れる
    @slot_money += money
  end

  # 払い戻し操作を行うと、投入金額の総計を釣り銭として出力する。
  def return_money
    # 返すお金の金額を表示する
    puts @slot_money
    # 自動販売機に入っているお金を0円に戻す
    @slot_money = 0
  end

  #売上金額を出すメソッド
  def profit(sales)
    @sales += sales
  end

  #購入できるかどうかを取得できる。
  def drink_buy(count, price, current_count)
    @salse = 0
    if @slot_money >= price*count && current_count >= count
      puts "購入できます"
      puts "購入しますか？"
      puts "ハイは１を、イイエは２を押してください"
      choice = gets.chomp
        while true
          if choice == "1"
            @salse += price*count
            @back_money = @slot_money - @salse
            @drink = current_count - count
            return p "購入しました、お釣りです#{@back_money}円"
          else
            return p "お釣りを返却します#{@slot_money} 円"
          end
        end
    end
  end
end

class Drink
  def initialize
    @drink = { name: "cola", price: 120, count: 5 }
  end

  # 格納されている飲み物の総計が取得できる
  def current_drink
    @drink_kind = { name: "redbull", price: 200, count: 5 },
                  { name: "water", price: 100, count: 5 }
    @drink_kind << @drink
  end
end

machine = VendingMachine.new
drink = Drink.new