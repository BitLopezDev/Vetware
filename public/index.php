<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Titulo</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            theme: {
                colors: {
                    'blue': '#1fb6ff',
                    'purple': '#7e5bef',
                    'pink': '#ff49db',
                    'orange': '#ff7849',
                    'green': '#13ce66',
                    'yellow': '#ffc82c',
                    'gray-dark': '#273444',
                    'gray': '#8492a6',
                    'gray-light': '#d3dce6',
                }
            }
    </script>
    <style type="text/tailwindcss">
        @layer utilities {
      .content-auto {
        content-visibility: auto;
      }
    }
  </style>
</head>

<body>
    <h1 class="text-3xl font-bold underline">
        Hello world!
    </h1>
</body>

</html>