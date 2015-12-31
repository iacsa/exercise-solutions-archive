lookup = {
  'just"not"right@example.com' => false,
  'a"b(c)d,e:f;g<h>i[j\k]l@example.com' => false,
  'very.common@example.com' => true,
  '<invalid>@foo.com' => false,
  'this\ still\"not\\\\allowed@example.com' => false,
  'b@domain.net' => true,
  'Abc.example.com' => false,
  'this is not true' => false,
  '1@d.net' => true,
  'this is"not\allowed@example.com' => false,
  'asterisk_domain@foo.*' => false,
  'A@b@c@example.com' => false,
  '"very.unusual.@.unusual.com"@example.com' => true,
  'niceandsimple@example.com' => true,
  'disposable.style.email.with+156@example.com' => true,
  'disposable.style.email.with+symbol@example.com' => true,
  'a.little.lengthy.but.fine@dept.example.com' => true,
  'bob123@alice123.com' => true,
  'hfij#kjdfvkl' => false,
  'b@d.net' => true
}

IO.foreach(ARGV[0]){|line|
  p lookup[line.chomp]
}
