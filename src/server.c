/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rotakesh <rotakesh@student.42sp.org.br>    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/09/20 17:51:42 by rotakesh          #+#    #+#             */
/*   Updated: 2022/10/25 00:51:56 by rotakesh         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"
#include <unistd.h>
#include <signal.h>

void	ft_signalhandler(int sig, siginfo_t *info, void *context)
{
	static int				i = 0;
	static unsigned char	c = 0;

	(void) context;
	if (sig == SIGUSR2)
		c = c | 1;
	if (i < 7)
		c = c << 1;
	i++;
	if (i == 8)
	{
		if (c == 0)
			kill(info->si_pid, SIGUSR2);
		ft_putchar_fd(c, 1);
		i = 0;
		c = 0;
	}
	usleep(10);
	kill(info->si_pid, SIGUSR1);
}

int	main(void)
{
	int					pid;
	struct sigaction	sig;

	sig.sa_sigaction = ft_signalhandler;
	sig.sa_flags = SA_SIGINFO;
	pid = getpid();
	ft_putnbr_fd(pid, 1);
	ft_putchar_fd('\n', 1);
	sigaction(SIGUSR1, &sig, 0);
	sigaction(SIGUSR2, &sig, 0);
	while (1)
		usleep(100);
	return (0);
}
