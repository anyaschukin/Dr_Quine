GREEN=\033[1;32m

COLLEEN = Colleen
GRACE = Grace
SULLY = Sully

NAME = $(COLLEEN) $(GRACE) $(SULLY)

SRC_COLLEEN = Colleen.c
SRC_GRACE = Grace.c
SRC_SULLY = Sully.c

OBJ_COLLEEN = $(SRC_COLLEEN:.c=.o)
OBJ_GRACE = $(SRC_GRACE:.c=.o)
OBJ_SULLY = $(SRC_SULLY:.c=.o)

FLAGS = -Wall -Werror -Wextra

all: $(NAME)

$(OBJ_COLLEEN): $(SRC_COLLEEN)
	@gcc -c $(FLAGS) $(SRC_COLLEEN)
	@echo "${GREEN}Colleen compiled!${RESET}"

$(OBJ_GRACE): $(SRC_GRACE)
	@gcc -c $(FLAGS) $(SRC_GRACE)
	@echo "${GREEN}Grace compiled!${RESET}"

$(OBJ_SULLY): $(SRC_SULLY)
	@gcc -c $(FLAGS) $(SRC_SULLY)
	@echo "${GREEN}Sully compiled!${RESET}"

clean:
	@rm -rf $(OBJ_COLLEEN)
	@rm -rf $(OBJ_GRACE)
	@rm -rf $(OBJ_SULLY)

fclean: clean
	@rm -rf $(COLLEEN)
	@rm -rf $(GRACE)
	@rm -rf $(SULLY)

re: fclean all

.PHONY : all clean fclean re