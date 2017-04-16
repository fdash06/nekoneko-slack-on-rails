class <%= class_name %> < NekonekoSlackOnRails::Client

  # 発言にhelloが含まれたら、my_hello_methodを呼ぶ
  hear "hello", :my_hello_method

  # 発言が正規表現にマッチしたら、my_regexp_methodを呼ぶ
  hear /私は.*です/, :my_regexp_method

  def my_hello_method
    puts "Somebody said 'hello'"
  end

  def my_regexp_method(data)
    # メソッドが引数を持つ場合、第1引数に発言情報が渡される。
    puts "#{data.text}と発言しました。"
  end
end
