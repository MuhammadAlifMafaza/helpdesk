<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    @vite('resources/css/app.css')
</head>

<body class="min-h-screen bg-gradient-to-br from-slate-100 via-blue-50 to-indigo-100 overflow-hidden">

    <!-- Background blur -->
    <div class="absolute top-0 left-0 w-96 h-96 bg-blue-300/20 rounded-full blur-3xl -z-10"></div>
    <div class="absolute bottom-0 right-0 w-96 h-96 bg-indigo-300/20 rounded-full blur-3xl -z-10"></div>

    <div class="min-h-screen flex">

        <!-- LEFT -->
        <div class="w-full lg:w-1/2 flex items-center justify-center px-8 lg:px-20">

            <div class="w-full max-w-md">

                <!-- Logo -->
                <div class="mb-10">
                    <h1 class="text-3xl font-bold text-slate-800">
                        Helpdesk
                    </h1>
                    <p class="text-slate-500 mt-2">
                        Sign in to continue your dashboard access
                    </p>
                </div>

                <!-- Card -->
                <div class="bg-white/70 backdrop-blur-2xl border border-white/50 shadow-2xl rounded-3xl p-8">

                    @if ($errors->any())
                        <div class="mb-5 p-4 rounded-xl bg-red-50 border border-red-200 text-red-600 text-sm">
                            {{ $errors->first() }}
                        </div>
                    @endif

                    <form method="POST" action="/login" class="space-y-5">
                        @csrf

                        <div>
                            <label class="block text-sm font-medium text-slate-600 mb-2">
                                Email
                            </label>

                            <input
                                type="email"
                                name="email"
                                value="{{ old('email') }}"
                                required
                                placeholder="Enter your email"
                                class="w-full px-4 py-3 rounded-xl border border-slate-200 bg-white/80 focus:ring-2 focus:ring-blue-500 focus:outline-none">
                        </div>

                        <div>
                            <label class="block text-sm font-medium text-slate-600 mb-2">
                                Password
                            </label>

                            <input
                                type="password"
                                name="password"
                                required
                                placeholder="Enter your password"
                                class="w-full px-4 py-3 rounded-xl border border-slate-200 bg-white/80 focus:ring-2 focus:ring-blue-500 focus:outline-none">
                        </div>

                        <button
                            type="submit"
                            class="w-full py-3 rounded-xl bg-gradient-to-r from-blue-600 to-indigo-600 text-white font-semibold shadow-lg hover:scale-[1.01] transition">
                            Sign In
                        </button>
                    </form>

                </div>

            </div>

        </div>

        <!-- RIGHT IMAGE -->
        <div class="hidden lg:block lg:w-1/2 p-6">

            <div class="h-full rounded-l-[60px] overflow-hidden shadow-2xl">

                <img
                    src="{{ asset('images/login-side.jpg') }}"
                    alt="campus"
                    class="w-full h-full object-cover">

            </div>

        </div>

    </div>

</body>

</html>
