# middleman-multilanguage-blog

## Purpose

When I met [middleman](https://middlemanapp.com) I wanted to restart my blog.
But I also wanted to write posts in portuguese and english and I missed this
feature in Middleman, so I thought "why not implement myself"?

## Idea

I just wanted a simple way to write a blog post in two (or more) languages
and have a properly translated link for each other language in the post.

So I create a simple article and in the front matter I put the title and
language of the article's translation. For example, in a simple blog I
have an article at `source/articles/hello-world.html.markdown` with:

```
---
title: Hello World
date: 10/12/2013
translation:
  pt_br: Ola mundo
---

Hello world in en.
```

And another at `source/articles/ola-mundo.html.markdown`:

```
---
title: Ola mundo
date: 10/12/2013
---

Ola mundo em pt-br.
```

When I render the `Hello World` article I want a link to the Brazilian Portuguese
translation to be automatically added in the beginning of the article.
And this link should be written in the same language as the translation, of course.

## Basic usage

Mostly what is described in the `Idea` section. You activate the extension by adding
`activate :multilanguage_blog` to your `config.rb` and use the front matter to
describe article's translation like this:

```
---
title: My blog post
translation:
  pt_br: My pt-br title
---

Hello World
```

It requires that a post with title `My pt-br title` exists, otherwise bad things will happen.

Then you need to add the link for the translations that you want in your template by using
a helper injected into each article:

```
  <%= current_article.link_to_translated(:pt_br) %>
```

### Custom link text

You can easily customize each translation's link message like this:

```
activate :multilanguage_blog do |m|
  m.templates[:pt_br] = 'Deseja ler em portugues do brasil?'
  end

```

## Using articles with same title but different locales for the translations

Maybe you don't want to translate your titles and just let the extension guess the article's translations by using the same title. You need to activate `try_same_title` in the extension configuration in your `config.rb`:

```
activate :multilanguage_blog do |m|
  m.try_same_title = true
end
```

Then ensure your articles have the locale properly set, either through front matter or through the source path.

# License

Check `LICENSE` file.
